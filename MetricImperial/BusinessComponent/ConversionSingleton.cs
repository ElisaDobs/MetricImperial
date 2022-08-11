namespace MetricImperial.BusinessComponent
{
    public class ConversionSingleton
    {
        private static ConversionSingleton instance = null;
        private ConversionSingleton()
        {
        }
        public static ConversionSingleton GetInstance()
        {
            
            if (instance == null) return new ConversionSingleton();

            return instance;
        }

        public IUnitConversion GetUnitConversion(string pUnit, decimal pUnitVaue)
        {
            return new UnitConversionFactory(pUnit, pUnitVaue);
        }
    }
}
