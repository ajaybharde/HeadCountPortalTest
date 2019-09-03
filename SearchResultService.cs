using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;
using UkAppsUtils.Logging;
using Headcount.DTO;
using Headcount.ServiceModel.Types;
using ServiceStack.Common.Web;
using ServiceStack.ServiceInterface.Auth;
using System.Data;
using System.Data.SqlClient;
using Headcount.ServiceInterface.Utilities;


namespace Headcount.ServiceInterface.Services
{

    #region dto


    public class SearchResult
    {
        public int TotalCount { get; set; }
        public int ROWNUM { get; set; }
        public int HeadCountID { get; set; }
        public string Surname { get; set; }
        public string Forename { get; set; }
        public string FullName { get; set; }
        public string Personnel_NO { get; set; }
        public string UserID { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? ExpectedEndDate { get; set; }
        public DateTime? ActualEndDate { get; set; }
        public string HiringCompanyName { get; set; }
        public string OrganizationName { get; set; }
        public string LineManagerName { get; set; }
        public string SAP_PositionID { get; set; }
        public string PositionName { get; set; }
        public string LocalPositionCode { get; set; } 
    }


    #endregion

    [Route("/SearchResultService/Result", "GET")]
    public class SearchGetCriteria : IReturn<SearchLookUPDTO>
    {
        public int? Id { get; set; }
    }

    [Route("/SearchResultService/Result", "POST")]
    public class SearchPostCriteria
    {
        public PagingParameterDTO PagingData { get; set; }
        public SearchCriteriaDTO RptCriteria { get; set; }
    }

     [PermittedRoles(RoleDTO.Security_Team_Role, 
         RoleDTO.Facilities_Admin_Role, 
         RoleDTO.System_Admin_Role, 
         RoleDTO.Administrator_Role, 
         RoleDTO.Radonly_User_Role)]
    public class SearchResultService : Service
    {
        public SearchLookUPDTO Get(SearchGetCriteria request)
        {
            var HeadCountReportLooKUP = new SearchLookUPDTO();
            int Id = 0;
            request.Id = 0;
            List<LookUPExtension> objList = new List<LookUPExtension>();
            LookUPExtension objNoitem = new LookUPExtension();
            objNoitem.ID = 0;
            objNoitem.DisplayName = "No";
            objList.Add(objNoitem);
            LookUPExtension objYesitem = new LookUPExtension();
            objYesitem.ID = 1;
            objYesitem.DisplayName = "Yes";
            objList.Add(objYesitem);

            HeadCountReportLooKUP.SAP_ORG_Col = objList.OrderBy(a => a.DisplayName).ToList();
            HeadCountReportLooKUP.C_BAY_Col = objList.OrderBy(a => a.DisplayName).ToList();
         
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandText = "sp_GETReportLookup";
                dbCmd.Parameters.Add(new SqlParameter("@LookupTypeALIAS", "LINEMANAGER"));
                using (var reader = dbCmd.ExecuteReader())
                {
                    var RptResult = reader.ConvertToList<LookUPExtension>();
                    if (RptResult != null)
                    {
                        HeadCountReportLooKUP.LineManagerCol = RptResult;
                    }
                    else
                        HeadCountReportLooKUP.LineManagerCol = new List<LookUPExtension>();
                }

                ((SqlParameter)dbCmd.Parameters["@LookupTypeALIAS"]).Value = "HIRINGCOMP";
                using (var reader = dbCmd.ExecuteReader())
                {
                    var RptResult = reader.ConvertToList<LookUPExtension>();
                    if (RptResult != null)
                    {
                        HeadCountReportLooKUP.HiringCompanyCol = RptResult;
                    }
                    else
                        HeadCountReportLooKUP.HiringCompanyCol = new List<LookUPExtension>();
                }
                ((SqlParameter)dbCmd.Parameters["@LookupTypeALIAS"]).Value = "ORGANIZATION";
                using (var reader = dbCmd.ExecuteReader())
                {
                    var RptResult = reader.ConvertToList<LookUPExtension>();
                    if (RptResult != null)
                    {
                        HeadCountReportLooKUP.OrganizationCol = RptResult;
                    }
                    else
                        HeadCountReportLooKUP.OrganizationCol = new List<LookUPExtension>();
                }
                ((SqlParameter)dbCmd.Parameters["@LookupTypeALIAS"]).Value = "SECURITYPASS";
                using (var reader = dbCmd.ExecuteReader())
                {
                    var RptResult = reader.ConvertToList<LookUPExtension>();
                    if (RptResult != null)
                    {
                        HeadCountReportLooKUP.SecurityPassCol = RptResult;
                    }
                    else
                        HeadCountReportLooKUP.SecurityPassCol = new List<LookUPExtension>();
                }
                ((SqlParameter)dbCmd.Parameters["@LookupTypeALIAS"]).Value = "STATUS";
                using (var reader = dbCmd.ExecuteReader())
                {
                    var RptResult = reader.ConvertToList<LookUPExtension>();
                    if (RptResult != null)
                    {
                        HeadCountReportLooKUP.StatusCol = RptResult;
                    }
                    else
                        HeadCountReportLooKUP.StatusCol = new List<LookUPExtension>();
                }
            }            

            return HeadCountReportLooKUP;

        }

        public List<SearchResult> Post(SearchPostCriteria request)
        {
            if (request.RptCriteria != null)
            {
                

                using (var dbCmd = Db.CreateCommand())
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.CommandTimeout = 300;
                    dbCmd.CommandText = "sp_ServerSideSearchResult";
                  
                    
                    dbCmd.Parameters.Add(new SqlParameter("@Surname", request.RptCriteria.Surname));
                    dbCmd.Parameters.Add(new SqlParameter("@Forename", request.RptCriteria.Forename));
                    dbCmd.Parameters.Add(new SqlParameter("@Personnel_NO", request.RptCriteria.Personnel_NO));
                    dbCmd.Parameters.Add(new SqlParameter("@SAP_PositionID", request.RptCriteria.SAP_PositionID));
                    dbCmd.Parameters.Add(new SqlParameter("@UserID", request.RptCriteria.UserID));
                    dbCmd.Parameters.Add(new SqlParameter("@LocalPositionCode", request.RptCriteria.LocalPositionCode));
                    dbCmd.Parameters.Add(new SqlParameter("@OrganizationID", request.RptCriteria.OrganizationID));
                    dbCmd.Parameters.Add(new SqlParameter("@HiringCompanyID", request.RptCriteria.HiringCompanyID));
                    dbCmd.Parameters.Add(new SqlParameter("@LineManagerID", request.RptCriteria.LineManagerID));
                    dbCmd.Parameters.Add(new SqlParameter("@FreeText", request.RptCriteria.FreeText));
                    dbCmd.Parameters.Add(new SqlParameter("@ShowAdvanced", Convert.ToInt32(request.RptCriteria.ShowAdvanced)));
                   

                    dbCmd.Parameters.Add(new SqlParameter("@PageNo", request.PagingData.page));
                    dbCmd.Parameters.Add(new SqlParameter("@PageSize", request.PagingData.pageSize));
                    dbCmd.Parameters.Add(new SqlParameter("@SortColumn", request.PagingData.orderBy));
                    dbCmd.Parameters.Add(new SqlParameter("@SortOrder", request.PagingData.orderByReverse == true ? "DESC" : "ASC"));

                    using (var reader = dbCmd.ExecuteReader())
                    {
                        var RptResult = reader.ConvertToList<SearchResult>();
                        return RptResult;
                    }
                   
                }
                return new List<SearchResult>();
            }

            else
            {
                return new List<SearchResult>();
            }

        }

    }
}
