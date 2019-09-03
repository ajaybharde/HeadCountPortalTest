using Headcount.ServiceModel.Types;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{
    public class SearchLookUPDTO
    {
        public List<LookUPExtension> SAP_ORG_Col { get; set; }
        public List<LookUPExtension> C_BAY_Col { get; set; }
        public List<LookUPExtension> Active_Col { get; set; }
        //public List<Status> StatusCol { get; set; }
        //public List<HiringCompany> HiringCompanyCol { get; set; }
        //public List<Organization> OrganizationCol { get; set; }
        //public List<SecurityPass> SecurityPassCol { get; set; }
        public List<LookUPExtension> StatusCol { get; set; }
        public List<LookUPExtension> HiringCompanyCol { get; set; }
        public List<LookUPExtension> OrganizationCol { get; set; }
        public List<LookUPExtension> SecurityPassCol { get; set; }
        public List<LookUPExtension> LineManagerCol { get; set; }
    }
}
