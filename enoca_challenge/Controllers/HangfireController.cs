using enoca_challenge.Services.HangfireServices;
using Hangfire;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace enoca_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HangfireController : ControllerBase
    {
        private readonly IHangfireService _hangfireService;

        public HangfireController(IHangfireService hangfireService)
        {
            _hangfireService = hangfireService;
        }

        [HttpPost("carrier-reports")]
        public IActionResult GenerateCarrierReportsJob()
        {
            BackgroundJob.Enqueue<IHangfireService>(x => x.GenerateCarrierReportsJob());
            return Ok("GenerateCarrierReportsJob job has been enqueued.");
        }
    }
}
