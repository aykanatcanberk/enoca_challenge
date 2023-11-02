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
            _dataContext = dataContext;
        }

        [HttpGet]
        public async Task<IActionResult> ListCarriers()
        {
            try
            {
                var result = await _carrierService.ListCarriersAsync();
                return Ok(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in ListCarriers: {ex.Message}");
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpPost]
        public async Task<string> AddCarrierAsync(AddCarrierRequest newCarrier)
        {
            try
            {
                var carrier = new Carrier
                {
                    CarrierName = newCarrier.CarrierName,
                    CarrierIsActive = newCarrier.CarrierIsActive,
                    CarrierPlusDesiCost = newCarrier.CarrierPlusDesiCost
                };

                _dataContext.Carriers.Add(carrier);
                await _dataContext.SaveChangesAsync();

                return "Kargo Firma Eklendi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in AddCarrierAsync: {ex.Message}");
                throw;
            }
        }


        [HttpPut("{carrierId}")]
        public async Task<IActionResult> UpdateCarrier(int carrierId, [FromBody] UpdateCarrierRequest updateRequest)
        {
            try
            {
                var result = await _carrierService.UpdateCarrierAsync(carrierId, updateRequest);
                return Ok(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in UpdateCarrier: {ex.Message}");
                return StatusCode(500, "Internal Server Error");
            }
        }

        //Bana kalsa burada soft delete yapar db'de veriyi tutardım...
        [HttpDelete("{carrierId}")]
        public async Task<IActionResult> DeleteCarrier(int carrierId)
        {
            try
            {
                var result = await _carrierService.DeleteCarrierAsync(carrierId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in DeleteCarrier: {ex.Message}");
                return StatusCode(500, "Internal Server Error");
            }
        }
    }

}
