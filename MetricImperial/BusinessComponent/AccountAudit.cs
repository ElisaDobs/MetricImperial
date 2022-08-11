
using MetricImperial.Repository;

namespace MetricImperial.BusinessComponent
{
    public class AccountAudit : IAccountAudit
    {
        public AccountAudit() { }
        public void CreateAudit(Guid user_id, int audit_node_id, string from, string to)
        {
            AccountAuditRepository.SaveAudit(user_id, audit_node_id, from, to);
        }
    }
}
