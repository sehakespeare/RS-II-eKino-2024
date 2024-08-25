using eKino.Model;
using eKino.Model.Requests;
using eKino.Model.SearchObjects;
using eKino.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eKino.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [Authorize]
    public class MovieController : BaseCRUDController<Model.Movie, MovieSearchObject, MovieUpsertRequest, MovieUpsertRequest>
    {
        private readonly IMovieService _service;

        public MovieController(IMovieService service)
            : base(service)
        {
            _service = service;
        }

        [HttpGet("recommender/{userId}")]
        public ActionResult<List<Movie>> GetRecommendedMovies(int userId)
        {
            var recommendedMovies = _service.Recommender(userId);
            if (recommendedMovies == null || !recommendedMovies.Any())
            {
                return NotFound("No recommendations found for the user.");
            }
            return Ok(recommendedMovies);
        }
    }
}