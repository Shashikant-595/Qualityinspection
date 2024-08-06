using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Databaselayer
{
    public class Exportpacking
    {
        [Key]
        public int Id { get; set; }
        public string SapCode { get; set; }
        public string Batch { get; set; }
        public string SKU { get; set; }
        public int TotalSKU { get; set; }
        public int Quantity { get; set; }
    }
}
