using eKino.Model;
using eKino.Model.Requests;
using eKino.Model.SearchObjects;
using eKino.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace eKino.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [Authorize]
    public class ReportController : ControllerBase
    {
        private readonly IReportService _reportService;

        public ReportController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpGet("ticket-sales/{movieId}")]
        public ActionResult<IEnumerable<TicketSalesReport>> GetTicketSalesReport(int movieId)
        {
            var report = _reportService.GetTicketSalesReport(movieId);
            if (report == null || !report.Any())
            {
                return NotFound("No ticket sales report found for the given movie.");
            }
            return Ok(report);
        }

        [HttpGet("monthly-sales-report")]
        public IActionResult GetMonthlySalesReport()
        {
            var report = _reportService.GetMonthlySalesReport();
            if (report == null || !report.Any())
            {
                return NotFound("No ticket sales report found for the given movie.");
            }
            return Ok(report);
        }
    }
}
    