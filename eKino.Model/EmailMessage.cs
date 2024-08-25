using System;
using System.Collections.Generic;
using System.Text;

namespace eKino.Model
{
    public class EmailMessage
    {
        public string Subject { get; set; }
        public string Body { get; set; }
        public int ReservationId { get; set; }
        public int NumTickets { get; set; }
    }
}
