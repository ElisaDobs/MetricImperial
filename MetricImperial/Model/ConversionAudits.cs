using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MetricImperial.Model
{
    [Table("conversion_audits")]
    public class ConversionAudit
    {
        [Key]
        [Column("audit_id")]
        public int AuditId { get; set; }
        [Column("user_id")]
        public Guid UserId { get; set; }
        [Column("audit_node_id")]
        public int AuditNodeId { get; set; }
        [Column("unit_from")]
        public string UnitFrom { get; set; }
        [Column("unit_to")]
        public string UnitTo { get; set; }
        [Column("date_time_stamp")]
        public DateTime DateTimeStamp { get; set; }
    }
}
