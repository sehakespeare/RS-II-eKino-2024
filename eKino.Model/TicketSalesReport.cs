using System;
using System.Collections.Generic;
using System.Text;

namespace eKino.Model
{
    public class TicketSalesReport
    {
        public string MovieTitle { get; set; }
        public DateTime TransactionDate { get; set; }
        public int NumTicketsSold { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
