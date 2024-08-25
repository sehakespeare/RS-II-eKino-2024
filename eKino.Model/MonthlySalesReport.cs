using System;
using System.Collections.Generic;
using System.Text;

namespace eKino.Model
{
    public class MonthlySalesReport
    {
        public int Year { get; set; }
        public int Month { get; set; }
        public int TotalTicketsSold { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
