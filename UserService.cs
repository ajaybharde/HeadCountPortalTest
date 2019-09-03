using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Linq;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;
using UkAppsUtils.LDAP;
using Headcount.ServiceInterface.Resource;
using UkAppsUtils.Logging;
using Headcount.DTO;
using ServiceStack.ServiceInterface.Auth;
using ServiceModel.Types;

namespace Headcount.ServiceInterface
{




    [Route("/user")]
    public class UserReq : IReturn<UserDTO>
    {

    }

    [Route("/user/RoleList")]
    public class RoleListReq : IReturn<List<RoleDTO>>
    {


    }

    [Route("/user/{AccountName}")]
    public class UserAdminReq : IReturn<UserAuth>
    {
        public string AccountName { get; set; }
    }

    [Route("/user/{AccountName}/roles", "POST")]
    public class AuthUserGroupReq : IReturn<UserAuth>
    {
        public string AccountName { get; set; }
        public List<string> Roles { get; set; }
    }

    [Route("/users")]
    [Route("/users/{RoleName}")]
    public class UsersReq : IReturn<UserAuth>
    {
        public string RoleName { get; set; }
    }


    #region Services

    public class UserService : Service
    {

        // Get single user
        public UserDTO Get(UserReq request)
        {
            UserDTO userDTO = null;
            try
            {
                if (String.IsNullOrEmpty(WindowsHelper.WindowsUserName))
                {
                    throw new ApplicationException("Windows Authentication is not enabled");
                }
                else
                {
                    UserAuth userAuth = Db.Select<UserAuth>(u => u.UserName == WindowsHelper.WindowsUserName).FirstOrDefault();
                    userDTO = new UserDTO
                    {
                        AppUser = userAuth,
                        IsAdmin = userAuth.Roles.Contains(HeadcountResource.Administrator_Role),
                        IsReadOnlyUser = userAuth.Roles.Contains(HeadcountResource.Readonly_User_Role),
                        IsFacilitiesAdmin = userAuth.Roles.Contains(HeadcountResource.Facilities_Admin_Role),
                        IsSecurityTeam = userAuth.Roles.Contains(HeadcountResource.Security_Team_Role),
                        IsSystemAdmin = userAuth.Roles.Contains(HeadcountResource.System_Admin_Role),
                    };
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.InsertError("app Error " + WindowsHelper.WindowsUserName, ex);

            }
            return userDTO;
        }


        public List<RoleDTO> Get(RoleListReq request)
        {
            var RoleList = HeadcountResource.Role_List.Split(',').ToList();
            var roleDTOList = new List<RoleDTO>();
            foreach (var item in RoleList)
            {
                roleDTOList.Add(new RoleDTO { RoleName = item });
            }
            return roleDTOList;
        }


        // Get users by role
        public List<UserAuth> Get(UsersReq request)
        {
            List<UserAuth> users =
                (string.IsNullOrEmpty(request.RoleName) || request.RoleName == "undefined")
                ? Db.Select<UserAuth>().OrderBy(x => x.UserName).OrderBy(x => x.DisplayName).ToList()
                : Db.Select<UserAuth>(u => u.Roles.Contains(request.RoleName)).OrderBy(x => x.DisplayName).ToList();

            return users;
        }

        // Create new user
        [PermittedRoles(RoleDTO.System_Admin_Role)]
        public List<UserAuth> Post(UserAdminReq request)
        {
            // Make sure we have an accountName
            if (string.IsNullOrEmpty(request.AccountName))
            {
                throw new Exception("An account name must be supplied");
            }
            // Make sure the user doesn't already exist
            UserAuth user = Db.Select<UserAuth>(x => x.UserName == request.AccountName).FirstOrDefault();
            if (user != null)
            {
                throw new Exception(string.Format("User {0} already exists", request.AccountName));
            }
            // Create the user
            var auth = new CustomCredentialsAuthProvider();
            UserAuth userAuth = auth.CreateAuthenticatedUser(request.AccountName, HeadcountResource.Readonly_User_Role);

            return new UserService().Get(new UsersReq());
        }

        // Delete user
        [PermittedRoles(RoleDTO.System_Admin_Role)]
        public List<UserAuth> Delete(UserAdminReq request)
        {
            using (IDbTransaction dbTrans = Db.BeginTransaction())
            {
                try
                {
                    Db.Delete<UserAuth>(x => x.UserName == request.AccountName);
                    Db.Delete<UserAuthAccessLog>(x => x.UserId == request.AccountName);
                    dbTrans.Commit();
                    return new UserService().Get(new UsersReq());
                }
                catch (Exception)
                {
                    dbTrans.Rollback();
                    throw new ApplicationException("Failed to delete user.");
                }
            }
        }

        // Change user roles
        [PermittedRoles(RoleDTO.System_Admin_Role)]
        public UserAuth Post(AuthUserGroupReq request)
        {
            if (string.IsNullOrEmpty(request.AccountName))
                throw new Exception("An account name must be supplied");

            // Clear the user's groups and add the new one
            UserAuth userAuth = Db.Select<UserAuth>(x => x.UserName == request.AccountName).FirstOrDefault();
            if (userAuth != null)
            {

                //if (request.Roles.Contains(RoleDTO.)
                //{
                    
                //}
                userAuth.Roles = request.Roles;
                if (!userAuth.Roles.Contains(RoleDTO.Guest_Role))
                {
                    userAuth.Roles.Add(RoleDTO.Guest_Role);
                }
                userAuth.Roles.OrderBy(a => a);
                Db.Save(userAuth);
            }

            return userAuth;
        }

    #endregion
    }
}
