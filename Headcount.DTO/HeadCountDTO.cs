using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Headcount.ServiceModel.Types;


namespace Headcount.DTO
{
   public class HeadCountDTO
    {
       public HeadCount HeadCountItem { get; set; }
       public List<Status> StatusCol { get; set; }
       public List<HiringCompany> HiringCompanyCol { get; set; }
       public List<Organization> OrganizationCol { get; set; }
       public List<SecurityPass> SecurityPassCol { get; set; }
      
       public List<UploadFileDetail> UploadFileDetails { get; set; }
    }
}
