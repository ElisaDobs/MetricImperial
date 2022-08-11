
using MetricImperial.Enums;

namespace MetricImperial.BusinessComponent
{
    public class UnitConversionFactory : IUnitConversion
    {
        private string unit;
        private decimal unitValue;
        public UnitConversionFactory(string unit, decimal unitValue) {
            this.unit = unit;
            this.unitValue = unitValue;
        }
        public IConversion Create(Conversion conversion)
        {
            if (conversion == Conversion.METRIC_IMPERIAL) return new MetricImperialConversion(unit, unitValue);

            return new ImperialMetricConversion(unit, unitValue);
        }
    }
}
