using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{
    public class RoleDTO
    {

        public const string Administrator_Role = "Admin";
        public const string Facilities_Admin_Role = "FacilitiesAdmin";
        public const string Radonly_User_Role = "ReadonlyUser";
        public const string Security_Team_Role = "SecurityTeam";
        public const string System_Admin_Role = "SystemAdmin";
        public const string Guest_Role = "Guest";
        public int? RoleId { get; set; }
        public string RoleName { get; set; }

    }
}
