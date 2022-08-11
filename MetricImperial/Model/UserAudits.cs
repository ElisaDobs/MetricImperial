using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MetricImperial.Model
{
    [Table("user_audits")]
    public class UserAudit
    {
        [Key]
        [Column("audit_id")]
        public int AuditId { get; set; }
        [Column("user_id")]
        public Guid UserId { get; set; }
        [Column("audit_node_id")]
        public int AuditNodeId { get; set; }
        [Column("user_from")]
        public string UserFrom { get; set; }
        [Column("user_to")]
        public string UserTo { get; set; }
        [Column("date_time_stamp")]
        public DateTime DateTimeStamp { get; set; }
    }
}
