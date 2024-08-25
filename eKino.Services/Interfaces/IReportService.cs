using eKino.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eKino.Services.Interfaces
{
    public interface IReportService
    {
        IEnumerable<TicketSalesReport> GetTicketSalesReport(int movieId);
        IEnumerable<MonthlySalesReport> GetMonthlySalesReport();
    }
}
