using AutoMapper;
using eKino.Model.Requests;
using eKino.Model.SearchObjects;
using eKino.Services.Database;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Microsoft.EntityFrameworkCore;
using eKino.Model;
using eKino.Services.Helpers;
using eKino.Services.Interfaces;
using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;

namespace eKino.Services.Implementations
{
    public class MovieService : BaseCRUDService<Model.Movie, Database.Movie, MovieSearchObject, MovieUpsertRequest, MovieUpsertRequest>, IMovieService
    {
        public MovieService(eKinoContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.Movie> AddFilter(IQueryable<Database.Movie> query, MovieSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.Title))
            {
                filteredQuery = filteredQuery.Where(x => x.Title.Contains(search.Title));
            }

            if (search?.Year != null)
            {
                filteredQuery = filteredQuery.Where(x => x.Year == search.Year);
            }
            
            if (search?.DirectorId != null)
            {
                filteredQuery = filteredQuery.Where(x => x.DirectorId == search.DirectorId);
            }
            filteredQuery = filteredQuery.Where(x => !x.IsDeleted);

            return filteredQuery;
        }

        public override IQueryable<Database.Movie> AddInclude(IQueryable<Database.Movie> query, MovieSearchObject search = null)
        {
            query = query.Include(x => x.Director);
            query = query.Include("MovieGenres.Genre");
            return base.AddInclude(query, search);
        }

        public override Model.Movie Insert(MovieUpsertRequest insert)
        {
            var entity = base.Insert(insert);

            foreach (var genreId in insert.MovieGenreIdList)
            {
                Database.MovieGenre movieGenre = new Database.MovieGenre
                {
                    GenreId = genreId,
                    MovieId = entity.MovieId,
                };

                Context.MovieGenres.Add(movieGenre);
            }

            Context.SaveChanges();

            return entity;
        }

        public override Model.Movie? Update(int id, MovieUpsertRequest update)
        {
            var entity = Context.Movies.Where(x => x.MovieId == id).Include(x => x.MovieGenres).FirstOrDefault();

            if (entity != null)
            {
                Mapper.Map(update, entity);

                if (update.MovieGenreIdList != null)
                {
                    for (int i = 0; i < entity.MovieGenres.Count; i++)
                    {
                        if (!update.MovieGenreIdList.Any(roleId => roleId == entity.MovieGenres.ElementAt(i).GenreId))
                        {
                            entity.MovieGenres.Remove(entity.MovieGenres.ElementAt(i));
                            i--;
                        }
                    }

                    foreach (var genreId in update.MovieGenreIdList)
                    {
                        if (!entity.MovieGenres.Any(x => x.GenreId == genreId))
                        {
                            entity.MovieGenres.Add(new Database.MovieGenre
                            {
                                GenreId = genreId
                            });
                        }
                    }
                }
            }
            else
            {
                return null;
            }

            Context.SaveChanges();

            return Mapper.Map<Model.Movie>(entity);
        }

        public List<Model.Movie> Recommender(int userId)
        {
            // Dohvati sve ocjene
            var ratingsData = Context.Ratings.Include(r => r.Movie).ToList();

            // Grupiraj ocjene po korisnicima
            var userRatings = ratingsData
                .Where(r => r.UserId == userId)
                .GroupBy(r => r.UserId)
                .ToDictionary(g => g.Key, g => g.Select(r => Mapper.Map<Model.Rating>(r)).ToList());

            // Svi korisnici osim trenutnog korisnika
            var otherUserRatings = ratingsData
                .Where(r => r.UserId != userId)
                .GroupBy(r => r.UserId)
                .ToDictionary(g => g.Key, g => g.Select(r => Mapper.Map<Model.Rating>(r)).ToList());

            // Lista za pohranu sličnosti
            var userSimilarities = new List<Tuple<int, double>>();

            // Izračunaj sličnosti između trenutnog korisnika i svih ostalih korisnika
            foreach (var kvp in otherUserRatings)
            {
                double similarity = CalculateCosineSimilarity(userRatings[userId], kvp.Value);
                userSimilarities.Add(new Tuple<int, double>(kvp.Key, similarity));
            }

            // Sortiraj po sličnosti
            var sortedSimilarUsers = userSimilarities.OrderByDescending(u => u.Item2).ToList();

            // Dohvati filmove koje su visoko slični korisnici ocijenili, a trenutni korisnik nije
            var recommendedMovies = new List<Database.Movie>();
            foreach (var similarUser in sortedSimilarUsers.Take(5)) // Uzmi top 5 sličnih korisnika
            {
                var similarUserRatings = otherUserRatings[similarUser.Item1];
                foreach (var rating in similarUserRatings)
                {
                    if (!userRatings[userId].Any(r => r.MovieId == rating.MovieId))
                    {
                        var movie = Context.Movies.FirstOrDefault(m => m.MovieId == rating.MovieId);
                        if (movie != null)
                        {
                            recommendedMovies.Add(movie);
                        }
                    }
                }
            }

            // Vrati jedinstvene preporučene filmove
            return recommendedMovies.Distinct().Select(m => Mapper.Map<Model.Movie>(m)).ToList();
        }

        private double CalculateCosineSimilarity(List<Model.Rating> ratings1, List<Model.Rating> ratings2)
        {
            var commonRatings1 = ratings1.Where(r1 => ratings2.Any(r2 => r2.MovieId == r1.MovieId)).ToList();
            var commonRatings2 = ratings2.Where(r2 => ratings1.Any(r1 => r1.MovieId == r2.MovieId)).ToList();

            if (!commonRatings1.Any() || !commonRatings2.Any())
            {
                return 0;
            }

            double dotProduct = 0;
            double magnitude1 = 0;
            double magnitude2 = 0;

            for (int i = 0; i < commonRatings1.Count; i++)
            {
                dotProduct += commonRatings1[i].Value * commonRatings2[i].Value;
                magnitude1 += Math.Pow(commonRatings1[i].Value, 2);
                magnitude2 += Math.Pow(commonRatings2[i].Value, 2);
            }

            magnitude1 = Math.Sqrt(magnitude1);
            magnitude2 = Math.Sqrt(magnitude2);

            if (magnitude1 == 0 || magnitude2 == 0)
            {
                return 0;
            }

            return dotProduct / (magnitude1 * magnitude2);
        }
    }
}