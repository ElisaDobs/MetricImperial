using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MetricImperial.Model
{
    [Table("users")]
    public class User
    {
        [Key]
        [Column("user_id")]
        public Guid UserId { get; set; }
        [Column("user_name")]
        public string UserName { get; set; }
        [Column("user_last_name")]
        public string UserLastName { get; set; }
        [Column("user_password")]
        public string UserPassword { get; set; }
        [Column("date_time_stamp")]
        public DateTime DateTimeStamp {get;set;}
    }
}
