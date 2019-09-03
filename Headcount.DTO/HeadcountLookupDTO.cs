using Headcount.ServiceModel.Types;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Headcount.DTO
{
    public class HeadcountLookupDTO
    {
        public List<Status> StatusCol { get; set; }
        public List<HiringCompany> HiringCompanyCol { get; set; }
        public List<Organization> OrganizationCol { get; set; }
        public List<SecurityPass> SecurityPassCol { get; set; }
       
        public List<Position> PositionCol { get; set; }
        public List<LocalPosition> LocalPositionCol { get; set; }
      
        public List<HeadcountUserDTO> HeadcountUserList { get; set; }
        
    }
}
