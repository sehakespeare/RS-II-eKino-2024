using System;
using System.Collections.Generic;

namespace eKino.Services.Database
{
    public partial class User : SoftDeletableEntity
    {
        public User()
        {
            UserRoles = new HashSet<UserRole>();
        }

        public int UserId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string Username { get; set; } = null!;
        public string PasswordHash { get; set; } = null!;
        public string PasswordSalt { get; set; } = null!;
        public bool? Status { get; set; }

        public int? SpolId { get; set; } 
        public virtual Spol? Spol { get; set; }

        public int? RadniStatusId { get; set; }
        public virtual RadniStatus? RadniStatus { get; set; }

        public int? StepenObrazovanjaId { get; set; }
        public virtual StepenObrazovanja? StepenObrazovanja { get; set; }



        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
