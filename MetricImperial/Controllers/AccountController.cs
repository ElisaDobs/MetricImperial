using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MetricImperial.Repository;
using MetricImperial.Enums;
using MetricImperial.Extensions;
using Newtonsoft.Json;
using MetricImperial.BusinessComponent;
using MetricImperial.Model;

namespace MetricImperial.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private AccountRepository repository = new AccountRepository();
        [Microsoft.AspNetCore.Mvc.Route("ValidateUser")]
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public OkObjectResult ValidateUser(string username="", string password="")
        {
            try
            {
                var user = repository.Validate(username, password);
                if (user != null)
                {
                    return Ok(user);
                }
                else
                {
                    throw new Exception("Please provide the correct username and password!");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [Microsoft.AspNetCore.Mvc.Route("CreateUser")]
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public OkObjectResult CreateUser(string username="", string lastname="", string password="")
        {
            try
            {
                var user = repository.CreateUser(username, lastname, password);
                if (user != null)
                {
                    return Ok(user);
                }
                else
                {
                    throw new Exception("The user is not created in system!");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
