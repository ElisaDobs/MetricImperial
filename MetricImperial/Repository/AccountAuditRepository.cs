using MetricImperial.Model;
using MetricImperial.Extensions;
using MetricImperial.DAL;

namespace MetricImperial.Repository
{
    public static class AccountAuditRepository
    {
        public static void SaveAudit(Guid user_id, int audit_node_id, string unit_from, string unit_to)
        {
            using (AyoContext context = new AyoContext())
            {
                UserAudit audit = new UserAudit()
                {
                    UserId = user_id,
                    AuditNodeId = audit_node_id,
                    UserFrom = unit_from,
                    UserTo = unit_to,
                    DateTimeStamp = DateTime.Now.SetKindUtc()
                };
                context.UserAudits.Add(audit);
                context.SaveChanges();
            }
        }
    }
}
