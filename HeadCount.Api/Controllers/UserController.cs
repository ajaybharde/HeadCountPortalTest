using Headcount.DTO;
using HeadCount.Api.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HeadCount.Api.Controllers
{
    public class UserController : ApiController
    {
        public UserDTO Get()
        {
            UserDTO userDTO = null;
            var userAuth = new UserAuth { FirstName = "TestFirstName", LastName = "TestLastName", Email = "test@sample.com", Roles = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" }, Permissions = new List<string> { "SystemAdmin", "Admin", "FacilitiesAdmin", "ReadonlyUser", "SecurityTeam" } };

            userDTO = new UserDTO
            {
                AppUser = userAuth,
                IsAdmin = userAuth.Roles.Contains(HeadcountResource.Administrator_Role),
                IsReadOnlyUser = userAuth.Roles.Contains(HeadcountResource.Readonly_User_Role),
                IsFacilitiesAdmin = userAuth.Roles.Contains(HeadcountResource.Facilities_Admin_Role),
                IsSecurityTeam = userAuth.Roles.Contains(HeadcountResource.Security_Team_Role),
                IsSystemAdmin = userAuth.Roles.Contains(HeadcountResource.System_Admin_Role),
            };
            return userDTO;
        }
    }
}
