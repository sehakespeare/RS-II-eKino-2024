using AutoMapper;
using eKino.Model;
using eKino.Services.Database;
using eKino.Services.Interfaces;
using System;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eKino.Services.Implementations
{
    public class ReportService : IReportService
    {
        private readonly eKinoContext _context;
        private readonly IMapper _mapper;

        public ReportService(eKinoContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public IEnumerable<TicketSalesReport> GetTicketSalesReport(int movieId)
        {
            var query = from transaction in _context.Transactions
                        join reservation in _context.Reservations on transaction.ReservationId equals reservation.ReservationId
                        join projection in _context.Projections on reservation.ProjectionId equals projection.ProjectionId
                        join movie in _context.Movies on projection.MovieId equals movie.MovieId
                        where movie.MovieId == movieId
                        group transaction by transaction.DateOfTransaction.Date into g
                        select new TicketSalesReport
                        {
                            MovieTitle = g.FirstOrDefault().Reservation.Projection.Movie.Title,
                            TransactionDate = g.Key,
                            NumTicketsSold = g.Sum(t => t.Reservation.NumTickets),
                            TotalAmount = g.Sum(t => t.Amount)
                        };

            return query.ToList();
        }

        public IEnumerable<MonthlySalesReport> GetMonthlySalesReport()
        {
            var oneYearAgo = DateTime.Now.AddYears(-1);

            var query = from transaction in _context.Transactions
                        join reservation in _context.Reservations on transaction.ReservationId equals reservation.ReservationId
                        join projection in _context.Projections on reservation.ProjectionId equals projection.ProjectionId
                        join movie in _context.Movies on projection.MovieId equals movie.MovieId
                        where transaction.DateOfTransaction >= oneYearAgo
                        group transaction by new { transaction.DateOfTransaction.Year, transaction.DateOfTransaction.Month } into g
                        orderby g.Key.Year, g.Key.Month
                        select new MonthlySalesReport
                        {
                            Year = g.Key.Year,
                            Month = g.Key.Month,
                            TotalTicketsSold = g.Sum(t => t.Reservation.NumTickets),
                            TotalAmount = g.Sum(t => t.Amount)
                        };

            return query.ToList();
        }

        
    }
}
