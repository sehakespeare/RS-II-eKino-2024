using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eKino.EmailSubscriber.Utils
{
    public class MailSMTP
    {
        public string From { get; set; }
        public string Password { get; set; }
        public string Host { get; set; }
        public string To { get; set; }

    }
}
