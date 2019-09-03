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
using System.IO;
using Headcount.ServiceInterface.ServiceHelpers;
using Headcount.ServiceInterface.Resource;
using System.ComponentModel;
using System.Globalization;


namespace Headcount.ServiceInterface.Services
{

    #region dto


    public class ReportResult
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
        public string Active { get; set; }

    }

    public class ExportToExcelResult
    {
        [DisplayName("Surname")]
        public string Surname { get; set; }
        [DisplayName("Forename")]
        public string Forename { get; set; }
        [DisplayName("Full Name")]
        public string FullName { get; set; }
        [DisplayName("User ID")]
        public string UserID { get; set; }

        [DisplayName("FTE Number")]
        public string FTE { get; set; }
        [DisplayName("Status")]
        public string StatusName { get; set; }
        [DisplayName("Organization")]
        public string OrganizationName { get; set; }
        [DisplayName("Security Pass")]
        public string SecurityPassName { get; set; }
        [DisplayName("Hiring Company")]
        public string HiringCompanyName { get; set; }
        [DisplayName("Line Manager")]
        public string LineManagerName { get; set; }
        [DisplayName("Line Manager Personnel Number")]
        public string LineManager_NO { get; set; }
        [DisplayName("Security Pass Approving Manager")]
        public string ApproveManagerName { get; set; }
        [DisplayName("SAP Personnel Number")]
        public string Personnel_NO { get; set; }
        [DisplayName("SAP Position ID")]
        public string SAP_PositionID { get; set; }
        [DisplayName("Position Name")]
        public string PositionName { get; set; }
        [DisplayName("SAP Org Chart")]
        public string SAP_Org_Chart { get; set; }
        [DisplayName("Eligible for C-Bay")]
        public string C_BAY { get; set; }
        [DisplayName("IPhone")]
        public string I_Phone { get; set; }
        [DisplayName("Phone Extension")]
        public string Phone_Extn { get; set; }
        [DisplayName("IT Hardware")]
        public string IT_Hardware { get; set; }
        [DisplayName("Start Date")]
        public string StartDate { get; set; }
        [DisplayName("Expected Finish Date")]
        public string ExpectedEndDate { get; set; }
        [DisplayName("Actual Finish Date")]
        public string ActualEndDate { get; set; }
        [DisplayName("Active")]
        public string Active { get; set; }
        [DisplayName("Eligible for Permanent Desk")]
        public string Desk { get; set; }
        [DisplayName("Location")]
        public string LocationName { get; set; }
        //[DisplayName("Submitted")]
        //public bool? IsSubmitted { get; set; }
        //[DisplayName("Saved")]
        //public bool? IsSaved { get; set; }
        //[DisplayName("Security Edited")]
        //public bool? IsSecurityEdited { get; set; }
        [DisplayName("Local Position Code")]
        public string LocalPositionCode { get; set; }
        //public int? StatusID { get; set; }
        //public int? HiringCompanyID { get; set; }
        //public int? OrganizationID { get; set; }
        //public int? LineManagerID { get; set; }
        //public int? SecurityPassID { get; set; }
        //public int? ApproveManagerID { get; set; }
        //public string CreatedBy { get; set; }
        //public DateTime? CreatedDate { get; set; }
        //public string UpdatedBy { get; set; }
        //public DateTime? UpdatedDate { get; set; }
    }


    #endregion

    [Route("/ReportService/Result", "GET")]
    public class ReportGetCriteria : IReturn<SearchLookUPDTO>
    {
        public int? Id { get; set; }
    }

    [Route("/ReportService/Result", "POST")]
    public class ReportPostCriteria
    {
        public PagingParameterDTO PagingData { get; set; }
        public ReportCriteriaDTO RptCriteria { get; set; }
    }

    [Route("/ExportToExcelReport", "GET")]
    public class ExportToExcelReport
    {
        public string SAP_Org_Chart { get; set; }
        public string C_BAY { get; set; }
        public string Active { get; set; }
        public string SecurityPassID { get; set; }
        public string OrganizationID { get; set; }
        public string HiringCompanyID { get; set; }
        public string LineManagerID { get; set; }
    }


    public class ReportService : Service
    {
        public SearchLookUPDTO Get(ReportGetCriteria request)
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
            HeadCountReportLooKUP.Active_Col = objList.OrderBy(a => a.DisplayName).ToList();
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

        public List<ReportResult> Post(ReportPostCriteria request)
        {
            if (request.RptCriteria != null)
            {

                using (var dbCmd = Db.CreateCommand())
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.CommandTimeout = 300;
                    dbCmd.CommandText = "sp_ServerSidePagedReport";
                    dbCmd.Parameters.Add(new SqlParameter("@SAP_Org_Chart", request.RptCriteria.SAP_Org_Chart));
                    dbCmd.Parameters.Add(new SqlParameter("@C_BAY", request.RptCriteria.C_BAY));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", request.RptCriteria.Active));
                    dbCmd.Parameters.Add(new SqlParameter("@SecurityPassID", request.RptCriteria.SecurityPassID));
                    dbCmd.Parameters.Add(new SqlParameter("@OrganizationID", request.RptCriteria.OrganizationID));
                    dbCmd.Parameters.Add(new SqlParameter("@HiringCompanyID", request.RptCriteria.HiringCompanyID));
                    dbCmd.Parameters.Add(new SqlParameter("@LineManagerID", request.RptCriteria.LineManagerID));


                    dbCmd.Parameters.Add(new SqlParameter("@PageNo", request.PagingData.page));
                    dbCmd.Parameters.Add(new SqlParameter("@PageSize", request.PagingData.pageSize));
                    dbCmd.Parameters.Add(new SqlParameter("@SortColumn", request.PagingData.orderBy));
                    dbCmd.Parameters.Add(new SqlParameter("@SortOrder", request.PagingData.orderByReverse == true ? "DESC" : "ASC"));

                    using (var reader = dbCmd.ExecuteReader())
                    {
                        var RptResult = reader.ConvertToList<ReportResult>();
                        return RptResult;
                    }

                }
                //return new List<ReportResult>();
            }

            else
            {
                return new List<ReportResult>();
            }

        }

        public object Get(ExportToExcelReport request)
        {
            List<ExportToExcelResult> reportResult = null;
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.CommandText = "sp_ServerExpotToExcelReport";
                dbCmd.Parameters.Add(new SqlParameter("@SAP_Org_Chart", request.SAP_Org_Chart));
                dbCmd.Parameters.Add(new SqlParameter("@C_BAY", request.C_BAY));
                dbCmd.Parameters.Add(new SqlParameter("@Active", request.Active));
                dbCmd.Parameters.Add(new SqlParameter("@SecurityPassID", request.SecurityPassID));
                dbCmd.Parameters.Add(new SqlParameter("@OrganizationID", request.OrganizationID));
                dbCmd.Parameters.Add(new SqlParameter("@HiringCompanyID", request.HiringCompanyID));
                dbCmd.Parameters.Add(new SqlParameter("@LineManagerID", request.LineManagerID));


                using (var reader = dbCmd.ExecuteReader())
                {
                    reportResult = reader.ConvertToList<ExportToExcelResult>();

                }
                MemoryStream stream = null;
                if (reportResult == null)
                {
                    reportResult = new List<ExportToExcelResult>();
                }
                stream = ExportImportHelper.CreateCSVDocumentWithCaption(reportResult);
                HttpResult res = new HttpResult(stream, HeadcountResource.CSVContentType);
                res.Headers[HttpHeaders.ContentDisposition] = "attachment; filename=Report_" + DateTime.Today.ToString("dd-MMM-yyyy") + ".csv";
                return res;
            }

        }



    }
}
