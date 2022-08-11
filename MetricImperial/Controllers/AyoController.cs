using MetricImperial.BusinessComponent;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http;
using MetricImperial.Enums;
using MetricImperial.Extensions;
using MetricImperial.Repository;

namespace MetricImperial.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
    [ApiController]
    public class AyoController : ControllerBase
    {
        [Microsoft.AspNetCore.Mvc.Route("ConvertUnits")]
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public OkObjectResult ConvertUnitRates(string unit = "cm", decimal unitvalue = 15, int conversion_type = 1)
        {
            try
            {
                IUnitConversion unitConversion = ConversionSingleton.GetInstance().GetUnitConversion(unit, unitvalue);
                Conversion _conversion = (Conversion)Enum.ToObject(typeof(Conversion), conversion_type);
                IConversion conversion = unitConversion.Create(_conversion);
                string result = conversion.ConvertUnit();
                return Ok(result.ToJsonResponse());
            }
            catch(Exception)
            {
                throw;
            }  
        }

        [Microsoft.AspNetCore.Mvc.Route("GetMetricRateUnits")]
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public OkObjectResult GetMetricRateUnits()
        {
            AyoRepository ayoRepository = new AyoRepository();
            try
            {
                var metricunits = ayoRepository.GetMetricUnits();
                return Ok(metricunits);
            }
            catch (Exception)
            {
                throw;
            }
        }
        
        [Microsoft.AspNetCore.Mvc.Route("GetImperialRateUnits")]
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public OkObjectResult GetImperialRateUnits()
        {
            AyoRepository ayoRepository = new AyoRepository();
            try
            {
                var imperialunits = ayoRepository.GetImperialUnits();
                return Ok(imperialunits);
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}
