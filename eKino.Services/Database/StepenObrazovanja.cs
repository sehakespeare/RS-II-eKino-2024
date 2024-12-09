using System;
using System.Collections.Generic;

namespace eKino.Services.Database
{
    public partial class StepenObrazovanja : SoftDeletableEntity
    {
        public int StepenObrazovanjaId { get; set; }
        public string Naziv { get; set; } = null!;
        public virtual ICollection<User> Users { get; set; } = new HashSet<User>();
    }
}
