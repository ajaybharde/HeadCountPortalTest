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


    public class PendingRequestResult
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



    [Route("/PendingRequestService/Result", "POST")]
    public class PendingRequestPostCriteria
    {
        public PagingParameterDTO PagingData { get; set; }
        public PedingRequestCriteriaDTO RptCriteria { get; set; }
    }

    [PermittedRoles(RoleDTO.Security_Team_Role)]
    public class PendingRequestService : Service
    {


        public List<PendingRequestResult> Post(PendingRequestPostCriteria request)
        {
            if (request.RptCriteria != null)
            {               
                using (var dbCmd = Db.CreateCommand())
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.CommandTimeout = 300;
                    dbCmd.CommandText = "sp_ServerSidePendingRequestResult";

                    dbCmd.Parameters.Add(new SqlParameter("@FreeText", request.RptCriteria.FreeText));


                    dbCmd.Parameters.Add(new SqlParameter("@PageNo", request.PagingData.page));
                    dbCmd.Parameters.Add(new SqlParameter("@PageSize", request.PagingData.pageSize));
                    dbCmd.Parameters.Add(new SqlParameter("@SortColumn", request.PagingData.orderBy));
                    dbCmd.Parameters.Add(new SqlParameter("@SortOrder", request.PagingData.orderByReverse == true ? "DESC" : "ASC"));

                    using (var reader = dbCmd.ExecuteReader())
                    {
                        var RptResult = reader.ConvertToList<PendingRequestResult>();
                        return RptResult;
                    }                 
                }
                return new List<PendingRequestResult>();
            }

            else
            {
                return new List<PendingRequestResult>();
            }

        }

    }
}
