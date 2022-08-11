using MetricImperial.DAL;
using MetricImperial.Model;
using MetricImperial.Extensions;

namespace MetricImperial.Repository
{
    public static class ConversionAuditRepository
    {
        public static void SaveAudit(Guid user_id, int audit_node_id, string unit_from, string unit_to)
        {
            using (AyoContext context = new AyoContext())
            {
                ConversionAudit audit = new ConversionAudit() 
                { 
                    UserId = user_id,
                    AuditNodeId = audit_node_id,
                    UnitFrom = unit_from,
                    UnitTo = unit_to,
                    DateTimeStamp = DateTime.Now.SetKindUtc()
                };
                context.ConversionAudits.Add(audit);
                context.SaveChanges();
            }
        }
    }
}
