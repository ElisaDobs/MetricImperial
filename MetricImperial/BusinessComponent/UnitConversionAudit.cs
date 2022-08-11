using MetricImperial.Repository;

namespace MetricImperial.BusinessComponent
{
    public class UnitConversionAudit : IConversionAudit
    {
        public UnitConversionAudit() { }
        public void CreateAudit(Guid user_id, int audit_node_id, string from, string to)
        {
            ConversionAuditRepository.SaveAudit(user_id, audit_node_id, from, to);
        }
    }
}
