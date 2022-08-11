namespace MetricImperial.BusinessComponent
{
    public interface IAccountAudit
    {
        void CreateAudit(Guid user_id, int audit_node_id, string from, string to);
    }

    public interface IConversionAudit
    {
        void CreateAudit(Guid user_id, int audit_node_id, string from, string to);
    }
}
