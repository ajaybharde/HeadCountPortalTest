using System;
using System.Collections.Generic;
using System.Linq;
using ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;
using Headcount.DTO;
using Headcount.ServiceModel.Types;
using ServiceStack.ServiceInterface.Auth;
using System.Data;


namespace Headcount.ServiceInterface
{

     [PermittedRoles(RoleDTO.Security_Team_Role, 
         RoleDTO.Facilities_Admin_Role, 
         RoleDTO.System_Admin_Role, 
         RoleDTO.Administrator_Role, 
         RoleDTO.Radonly_User_Role)]
    public class SearchService : Service
    {

        [Route("/SearchService/Result", "POST")]
        public class SearchCriteria
        {
            public SearchCriteriaDTO Criteria { get; set; }
            public PagingParameterDTO PagingParam { get; set; }

        }

        public List<HeadCount> Get(SearchCriteria request)
        {
            var StatusCol = Db.Select<Status>().OrderBy(a => a.StatusName).ToList();
            var HiringCompanyCol = Db.Select<HiringCompany>().OrderBy(a => a.HiringCompanyName).ToList();
            var OrganizationCol = Db.Select<Organization>().OrderBy(a => a.OrganizationName).ToList();
            var SecurityPassCol = Db.Select<SecurityPass>().OrderBy(a => a.SecurityPassName).ToList();
            var UserCol = Db.Select<UserAuth>().Where(a =>
                 a.Roles.Contains(RoleDTO.Administrator_Role) == true
                 || a.Roles.Contains(RoleDTO.Facilities_Admin_Role) == true
                 || a.Roles.Contains(RoleDTO.Radonly_User_Role) == true
                 || a.Roles.Contains(RoleDTO.Security_Team_Role) == true
                 || a.Roles.Contains(RoleDTO.System_Admin_Role) == true).OrderBy(a => a.DisplayName).ToList();

            List<HeadCount> results = Db.Select<HeadCount>().ToList();
            results.ForEach(HeadCountItem =>
            {
                HeadCountItem.FullName = HeadCountItem.Forename + " " + HeadCountItem.Surname;
                HeadCountItem.StatusName = StatusCol.Where(a => a.Id == HeadCountItem.StatusID).Select(a => a.StatusName).FirstOrDefault();
                HeadCountItem.HiringCompanyName = HiringCompanyCol.Where(a => a.Id == HeadCountItem.HiringCompanyID).Select(a => a.HiringCompanyName).FirstOrDefault();
                HeadCountItem.OrganizationName = OrganizationCol.Where(a => a.Id == HeadCountItem.OrganizationID).Select(a => a.OrganizationName).FirstOrDefault();
                HeadCountItem.SecurityPassName = SecurityPassCol.Where(a => a.Id == HeadCountItem.SecurityPassID).Select(a => a.SecurityPassName).FirstOrDefault();
                HeadCountItem.ApproveManagerName = UserCol.Where(a => a.Id == HeadCountItem.ApproveManagerID).Select(a => a.DisplayName).FirstOrDefault();
                HeadCountItem.LineManagerName = UserCol.Where(a => a.Id == HeadCountItem.LineManagerID).Select(a => a.DisplayName).FirstOrDefault();
            });

            return results;
        }

        public List<HeadCount> Post(SearchCriteria request)
        {
            List<HeadCount> results = null;
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.CommandText = "sp_GetHeadcountDetailList";
                using (var reader = dbCmd.ExecuteReader())
                {
                    results = reader.ConvertToList<HeadCount>().ToList();
                }
            }
            return results;

        }




    }
}
