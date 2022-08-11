using MetricImperial.Enums;

namespace MetricImperial.BusinessComponent
{
    public interface IUnitConversion
    {
        IConversion Create(Conversion conversion);
    }
}
