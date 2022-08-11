
namespace MetricImperial.BusinessComponent
{
    public class AuditServiceLocator : IAuditService
    {
        public Dictionary<object, object> auditservicecontainer = null;
        public AuditServiceLocator()
        {
            auditservicecontainer = new Dictionary<object, object>();
            auditservicecontainer.Add(typeof(IAccountAudit), new AccountAudit());
            auditservicecontainer.Add(typeof(IConversionAudit), new UnitConversionAudit());
        }

        public T GetAuditService<T>()
        {
            return (T)auditservicecontainer[typeof(T)];
        }
    }
}
