using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{   
    public class SearchCriteria
    {      
        public int currentPage { get; set; }   
        public string filterBy { get; set; }       
        public object filterByFields { get; set; }     
        public string orderBy { get; set; }     
        public bool orderByReverse { get; set; }     
        public int pageItems { get; set; }
    }
}
