using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{
  public  class UserAuth
    {
        public  int? RefId { get; set; }
        public  DateTime ModifiedDate { get; set; }
        public  DateTime CreatedDate { get; set; }
        public  List<string> Permissions { get; set; }
        public  List<string> Roles { get; set; }
        public  string DigestHA1Hash { get; set; }
        public  string PasswordHash { get; set; }
        public  string Salt { get; set; }
        public  string TimeZone { get; set; }
        public  string PostalCode { get; set; }
        public  string Nickname { get; set; }
        public  string MailAddress { get; set; }
        public  string Language { get; set; }
        public  string Gender { get; set; }
        public  string FullName { get; set; }
        public  string Culture { get; set; }
        public  string Country { get; set; }
        public  string BirthDateRaw { get; set; }
        public  DateTime? BirthDate { get; set; }
        public  string DisplayName { get; set; }
        public  string LastName { get; set; }
        public  string FirstName { get; set; }
        public  string PrimaryEmail { get; set; }
        public  string Email { get; set; }
        public  string UserName { get; set; }
            
        public virtual Dictionary<string, string> Meta { get; set; }
    }
}
