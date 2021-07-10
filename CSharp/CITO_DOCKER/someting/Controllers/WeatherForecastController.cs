using someting.DataLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace someting.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {


        private readonly ILogger<WeatherForecastController> _logger;
        private DockerSqlServer dockerSqlServer;

        public WeatherForecastController(DockerSqlServer temp)
        {
            dockerSqlServer = temp;
        }

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var list1 = dockerSqlServer.sqlModels.ToList();
            return new JsonResult(list1);
        }
    }
}
