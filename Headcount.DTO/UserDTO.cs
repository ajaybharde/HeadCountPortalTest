
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;




namespace Headcount.DTO
{

    public class UserDTO
    {
        public UserAuth AppUser { get; set; }
        public bool IsUser { get; set; }
        public bool IsSystemAdmin { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsFacilitiesAdmin { get; set; }
        public bool IsSecurityTeam { get; set; }
        public bool IsReadOnlyUser { get; set; }
    }

}
