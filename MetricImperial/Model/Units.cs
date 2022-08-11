using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MetricImperial.Model
{
    [Table("units")]
    public class Unit
    {
        [Key]
        [Column("unit_id")]
        public int UnitId { get; set; }
        [Column("unit_name")]
        public string UnitName { get; set; }
        [Column("unit_desc")]
        public string UnitDesc { get; set; }
        [Column("conversion_id")]
        public int ConversionId { get; set; }
        [Column("unit_value")]
        public decimal UnitValue { get; set; }
        [Column("unit_name_to")]
        public string UnitNameTo { get; set; }
        [Column("unit_desc_to")]
        public string UnitDescTo { get; set; }
    }
}
