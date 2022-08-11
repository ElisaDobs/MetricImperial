using MetricImperial.Model;
using MetricImperial.BusinessComponent;
using MetricImperial.Enums;
using MetricImperial.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace MetricImperial.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuditController : ControllerBase
    {
        private AuditServiceLocator locator = new AuditServiceLocator();
        [Microsoft.AspNetCore.Mvc.Route("ValidateUserAudit")]
        [Microsoft.AspNetCore.Mvc.HttpPost]
        public OkObjectResult AccountValidateAudit()
        {
            try
            {
                User? user = JsonConvert.DeserializeObject<User>(Request.Form["User"].ToString());
                IAccountAudit service = locator.GetAuditService<IAccountAudit>();
                service.CreateAudit(
                                       user.UserId,
                                       (int)Audit.LOGIN_USER,
                                       $"username:{user.UserName},password:{user.UserPassword}",
                                       $"user:{JsonConvert.SerializeObject(user)}"
                                   );
                return Ok("Audit has been successfully created.".ToJsonResponse());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [Microsoft.AspNetCore.Mvc.Route("AccountCreateAudit")]
        [Microsoft.AspNetCore.Mvc.HttpPost]
        public OkObjectResult AccountCreateAudit()
        {
            try
            {
                User? user = JsonConvert.DeserializeObject<User>(Request.Form["User"].ToString());
                IAccountAudit service = locator.GetAuditService<IAccountAudit>();
                service.CreateAudit(
                                       user.UserId,
                                       (int)Audit.CREATE_USER,
                                       $"username:{user.UserName},lastname:{user.UserLastName},password:{user.UserPassword}",
                                       $"user:{JsonConvert.SerializeObject(user)}"
                                   );
                return Ok(("Audit has been successfully created.").ToJsonResponse());
            }
            catch(Exception)
            {
                throw;
            }
        }
        [Microsoft.AspNetCore.Mvc.Route("UnitConversionAudit")]
        [Microsoft.AspNetCore.Mvc.HttpPost]
        public OkObjectResult UnitConversionAudit(string user_id, decimal unit_value, string unit_ret,  string unit, int conversion_type)
        {
            try
            {
                IConversionAudit service = locator.GetAuditService<IConversionAudit>();
                Conversion _conversion = (Conversion)Enum.ToObject(typeof(Conversion), conversion_type);
                service.CreateAudit(
                                      Guid.Parse(user_id),
                                      _conversion == Conversion.METRIC_IMPERIAL ? (int)Audit.CONVERT_METRIC_IMPERIAL : (int)Audit.CONVERT_IMPERIAL_METRIC,
                                      $"{unit_value}{unit}",
                                      unit_ret
                                  );
                return Ok(("Audit has been successfully created.").ToJsonResponse());
            }
            catch (Exception)
            {
                throw;
            }
            
        }
    }
}
