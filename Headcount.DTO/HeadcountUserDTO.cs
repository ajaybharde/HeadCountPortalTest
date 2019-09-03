using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{
    public class HeadcountUserDTO
    {
        public int Id { get; set; }
        public string Surname { get; set; }
        public string Forename { get; set; }
        public string FullName { get; set; }
    }
}
