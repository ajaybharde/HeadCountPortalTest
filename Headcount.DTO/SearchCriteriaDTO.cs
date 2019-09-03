using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{


    public class ReportCriteriaDTO
    {
        public string Surname { get; set; }
        public string Forename { get; set; }
        public string SAP_Org_Chart { get; set; }
        public string C_BAY { get; set; }
        public string Active { get; set; }
        public string SecurityPassID { get; set; }
        public string OrganizationID { get; set; }
        public string HiringCompanyID { get; set; }
        public string LineManagerID { get; set; }
        public string FreeText { get; set; }
        public bool ShowAdvanced { get; set; }
    }
    public class SearchCriteriaDTO
    {
        public string Surname { get; set; }
        public string Forename { get; set; }
        public string Active { get; set; }
        public string Personnel_NO { get; set; }
        public string SAP_PositionID { get; set; }
        public string UserID { get; set; }
        public string LocalPositionCode { get; set; }
        public int OrganizationID { get; set; }
        public int HiringCompanyID { get; set; }
        public int LineManagerID { get; set; }
        public string FreeText { get; set; }
        public bool ShowAdvanced { get; set; }
    }
    public class PedingRequestCriteriaDTO
    {      
        public string FreeText { get; set; }       
    }

}
