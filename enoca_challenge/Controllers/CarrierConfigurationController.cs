using enoca_challenge.DTOs.Request.CarrierConfigurationRequest;
using enoca_challenge.Services.CarrierConfigurationServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace enoca_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrierConfigurationController : ControllerBase
    {
        private readonly ICarrierConfigurationService _carrierConfigurationService;

        public CarrierConfigurationController(ICarrierConfigurationService carrierConfigurationService)
        {
            _carrierConfigurationService = carrierConfigurationService;
        }

        [HttpGet]
        public async Task<IActionResult> ListCarrierConfigurations()
        {
            var result = await _carrierConfigurationService.ListCarrierConfigurationsAsync();
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddCarrierConfiguration([FromBody] AddCarrierConfigurationRequest addRequest)
        {
            var result = await _carrierConfigurationService.AddCarrierConfigurationAsync(addRequest);
            return Ok(result);
        }
        [HttpPut("{carrierConfigurationId}")]
        public async Task<IActionResult> UpdateCarrierConfiguration(int carrierConfigurationId, [FromBody] UpdateCarrierConfigurationRequest updateRequest)
        {

            var result = await _carrierConfigurationService.UpdateCarrierConfigurationAsync(carrierConfigurationId, updateRequest);
            return Ok(result);
        }
        [HttpDelete("{carrierConfigurationId}")]
        public async Task<IActionResult> DeleteCarrierConfiguration(int carrierConfigurationId)
        {

            var result = await _carrierConfigurationService.DeleteCarrierConfigurationAsync(carrierConfigurationId);
            return Ok(result);
        }
    }
}
