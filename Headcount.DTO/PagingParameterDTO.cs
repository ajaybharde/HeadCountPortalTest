using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Headcount.DTO
{


    public class PagingParameterDTO
    {
        public string filterBy { get; set; }
        public int currentPage { get; set; }
        public string orderBy { get; set; }
        public bool orderByReverse { get; set; }
        public int pageSize { get; set; }
        public int page { get; set; }
        public int gridTotalCount { get; set; }
        public bool coloumnSearch { get; set; }

    }

}
