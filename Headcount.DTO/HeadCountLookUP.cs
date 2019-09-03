using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{
    public class HeadCountLookUP
    {
        public long Id { get; set; }
        public long LookupTypeID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool? Active { get; set; }
        public string Audit_CreatedBy { get; set; }
        public DateTime Audit_CreatedDate { get; set; }
        public string Audit_UpdatedBy { get; set; }
        public DateTime Audit_UpdatedDate { get; set; }
    }
}
