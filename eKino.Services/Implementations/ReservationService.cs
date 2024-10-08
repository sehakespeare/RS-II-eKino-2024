﻿using AutoMapper;
using eKino.Model.Requests;
using eKino.Model.SearchObjects;
using eKino.Services.Database;
using EasyNetQ;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Microsoft.EntityFrameworkCore;
using eKino.Model;
using eKino.Services.Helpers;
using eKino.Services.Interfaces;

namespace eKino.Services.Implementations
{
    public class ReservationService : BaseCRUDService<Model.Reservation, Database.Reservation, ReservationSearchObject, ReservationUpsertRequest, ReservationUpsertRequest>, IReservationService
    {
        private readonly IEmailProviderService _emailProviderService;
        public ReservationService(eKinoContext context, IMapper mapper, IEmailProviderService emailProviderService) : base(context, mapper)
        {
            _emailProviderService = emailProviderService;
        }

        public override IQueryable<Database.Reservation> AddFilter(IQueryable<Database.Reservation> query, ReservationSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (search?.UserId != null)
            {
                filteredQuery = filteredQuery.Where(x => x.UserId == search.UserId);
            }
            
            if (search?.ProjectionId != null)
            {
                filteredQuery = filteredQuery.Where(x => x.ProjectionId == search.ProjectionId);
            }

            if (!string.IsNullOrEmpty(search?.MovieTitle))
            {
                filteredQuery = filteredQuery.Where(x => x.Projection.Movie.Title.Contains(search.MovieTitle));
            }

            if (search?.From != null)
            {
                filteredQuery = filteredQuery.Where(x => x.DateOfReservation.Date >= search.From.Value.Date);
            }

            if (search?.To != null)
            {
                filteredQuery = filteredQuery.Where(x => x.DateOfReservation.Date <= search.To.Value.Date);
            }
            filteredQuery = filteredQuery.Where(x => !x.IsDeleted);

            return filteredQuery;
        }

        public override IQueryable<Database.Reservation> AddInclude(IQueryable<Database.Reservation> query, ReservationSearchObject search = null)
        {
            query = query.Include(x => x.User);
            query = query.Include(x => x.Projection.Movie);
            return base.AddInclude(query, search);
        }

        public override Model.Reservation Insert(ReservationUpsertRequest insert)
        {
            var entity = base.Insert(insert);

            if (entity != null)
            {
                var emailMessage = new Model.EmailMessage
                {
                    Subject = "eKino - potvrda rezervacije",
                    Body = "Poštovani client, u ovom e-mailu Vam šaljemo ID kod Vaše rezervacije preko kojeg možete pristupiti auditorijumu za gledanje rezervirane projekcije te tačan broj karti koje ste rezervirali.",
                    ReservationId = entity.ReservationId,
                    NumTickets = entity.NumTickets,
                };


                _emailProviderService.SendMessage(emailMessage, "email");
            }


            return entity;
        }

    }
}