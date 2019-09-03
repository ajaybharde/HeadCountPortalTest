using Headcount.DTO;
using HeadCount.Business.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HeadCount.Business
{
    public class UserManager
    {

        public List<UserDTO> GetAuthUsersByRole(string role)
        {


            UserDTO userDTO = null;
            var userAuth = new UserAuth { FirstName = "TestFirstName", LastName = "TestLastName", DisplayName="TestApp", Email = "test@sample.com", Roles = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" }, Permissions = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" } };

            userDTO = new UserDTO
            {
                AppUser = userAuth,
                IsAdmin = userAuth.Roles.Contains(HeadCountResorces.Administrator_Role),
                IsReadOnlyUser = userAuth.Roles.Contains(HeadCountResorces.Readonly_User_Role),
                IsFacilitiesAdmin = userAuth.Roles.Contains(HeadCountResorces.Facilities_Admin_Role),
                IsSecurityTeam = userAuth.Roles.Contains(HeadCountResorces.Security_Team_Role),
                IsSystemAdmin = userAuth.Roles.Contains(HeadCountResorces.System_Admin_Role),
            };
            return new List<UserDTO> { userDTO };

        }

        public UserDTO GetUser()
        {
            UserDTO userDTO = null;
            var userAuth = new UserAuth { FirstName = "TestFirstName", LastName = "TestLastName", Email = "test@sample.com", Roles = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" }, Permissions = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" } };

            userDTO = new UserDTO
            {
                AppUser = userAuth,
                IsAdmin = userAuth.Roles.Contains(HeadCountResorces.Administrator_Role),
                IsReadOnlyUser = userAuth.Roles.Contains(HeadCountResorces.Readonly_User_Role),
                IsFacilitiesAdmin = userAuth.Roles.Contains(HeadCountResorces.Facilities_Admin_Role),
                IsSecurityTeam = userAuth.Roles.Contains(HeadCountResorces.Security_Team_Role),
                IsSystemAdmin = userAuth.Roles.Contains(HeadCountResorces.System_Admin_Role),
            };
            return userDTO;

        }

    }
}
