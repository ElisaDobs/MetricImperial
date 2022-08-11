using MetricImperial.Model;
using MetricImperial.DAL;
using MetricImperial.Enums;

namespace MetricImperial.Repository
{
    public class AyoRepository
    {
        public AyoRepository()
        {

        }

        public Unit? GetUnitByUnitConversion(string unit, int conversion)
        {
            using (AyoContext context = new AyoContext())
            {
                var unit_conversion = context.Units.FirstOrDefault(a => a.UnitName == unit && a.ConversionId == conversion);

                if (unit_conversion != null)
                {
                    return unit_conversion;
                }
                return default;
            }
        }

        public List<MetricUnit> GetMetricUnits()
        {
            using (AyoContext context = new AyoContext())
            {
                var units = context.Units.Where(a => a.ConversionId == (int)Conversion.METRIC_IMPERIAL).Select(a=> new MetricUnit() { UnitName = a.UnitName, UnitDesc = a.UnitDesc });

                return units.ToList();
            }
        }

        public List<ImperialUnit> GetImperialUnits()
        {
            using (AyoContext context = new AyoContext())
            {
                var units = context.Units.Where(a => a.ConversionId == (int)Conversion.IMPERIAL_METRIC).Select(a => new ImperialUnit() { UnitName = a.UnitName, UnitDesc = a.UnitDesc });

                return units.ToList();
            }
        }
    }
}
