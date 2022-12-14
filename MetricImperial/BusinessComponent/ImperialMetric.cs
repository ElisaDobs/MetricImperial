using MetricImperial.Enums;
using MetricImperial.Repository;

namespace MetricImperial.BusinessComponent
{
    public class ImperialMetricConversion : IConversion
    {
        private string unit;
        private decimal unitValue;
        public ImperialMetricConversion(string unit, decimal unitValue)
        {
            this.unit = unit;
            this.unitValue = unitValue;
        }

        public string ConvertUnit()
        {
            AyoRepository repository = new AyoRepository();
            var unit_convertion = repository.GetUnitByUnitConversion(unit, (int)Conversion.IMPERIAL_METRIC);
            if (unit_convertion != null) return string.Format("{0}{1}", (unitValue * unit_convertion.UnitValue), unit_convertion.UnitNameTo);

            return string.Empty;
        }
    }
}
