using ServiceStack.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.ServiceModel.Types
{
    public partial class HeadCount
    {
        [Ignore]
        public string StatusName { get; set; }
        [Ignore]
        public string OrganizationName { get; set; }
        [Ignore]
        public string SecurityPassName { get; set; }
        [Ignore]
        public string HiringCompanyName { get; set; }
        [Ignore]
        public string LineManagerName { get; set; }
        [Ignore]
        public string ApproveManagerName { get; set; }
        [Ignore]
        public string FullName { get; set; }
    }

    public class LookUPExtension
    {
        public int ID { get; set; }
        public string DisplayName { get; set; }
    }
}
