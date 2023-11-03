using enoca_challenge.DTOs.Request.CarrierRequest;
using enoca_challenge.Models;
using enoca_challenge.Services.CarrierServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Controllers
{
    [ApiController]
    [Route("api/carriers")]
    public class CarrierController : ControllerBase
    {
        private readonly ICarrierService _carrierService;
        private readonly DataContext _dataContext;

        public CarrierController(ICarrierService carrierService, DataContext dataContext)
        {
            _carrierService = carrierService;
        }

        [HttpGet]
        public async Task<IActionResult> ListCarriers()
        {
            var result = await _carrierService.ListCarriersAsync();
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddCarrierAsync(AddCarrierRequest newCarrier)
        {
            var result = await _carrierService.AddCarrierAsync(newCarrier);
            return Ok(result);
        }
        [HttpPut("{carrierId}")]
        public async Task<IActionResult> UpdateCarrier(int carrierId, [FromBody] UpdateCarrierRequest updateRequest)
        {
            var result = await _carrierService.UpdateCarrierAsync(carrierId, updateRequest);
            return Ok(result);
        }

        //Bana kalsa burada soft-delete yapar db'de veriyi tutardım...
        [HttpDelete("{carrierId}")]
        public async Task<IActionResult> DeleteCarrier(int carrierId)
        {      
            var result = await _carrierService.DeleteCarrierAsync(carrierId);
            if (result is null)
                return NotFound("Kargo Firması Zaten Mevcut Değil.");
            return Ok(result);
        }
    }

}
