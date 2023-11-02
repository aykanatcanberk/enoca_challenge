using enoca_challenge.DTOs.Request.CarrierRequest;
using enoca_challenge.DTOs.Response.CarrierResponse;
using enoca_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Services.CarrierServices
{
    public class CarrierService : ICarrierService
    {
        private readonly DataContext _dbContext;

        public CarrierService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
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

                _dbContext.Carriers.Add(carrier);
                await _dbContext.SaveChangesAsync();

                return "Kargo Firma Eklendi";
            }
            catch (Exception ex)
            {
                // Log the exception
                Console.WriteLine($"Error in AddCarrierAsync: {ex.Message}");
                throw;
            }
        }


        public Task<string> DeleteCarrierAsync(int carrierId)
        {
            throw new NotImplementedException();
        }

        public async Task<List<ListCarriersResponse>> ListCarriersAsync()
        {
            try
            {
                var carriers = await _dbContext.Carriers.ToListAsync();
                var responseList = carriers.Select(c => new ListCarriersResponse
                {
                    CarrierName = c.CarrierName,
                    CarrierIsActive = c.CarrierIsActive,
                    CarrierPlusDesiCost = c.CarrierPlusDesiCost
                }).ToList();

                return responseList;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in ListCarriersAsync: {ex.Message}");
                throw;
            }
        }

        public async Task<string> UpdateCarrierAsync(int carrierId, UpdateCarrierRequest updateRequest)
        {
            try
            {
                var existingCarrier = await _dbContext.Carriers.FindAsync(carrierId);
                if (existingCarrier == null)
                    return "Belirtilen ID'ye sahip kargo firma bulunamadı";

                existingCarrier.CarrierName = updateRequest.CarrierName;
                existingCarrier.CarrierIsActive = updateRequest.CarrierIsActive;
                existingCarrier.CarrierPlusDesiCost = updateRequest.CarrierPlusDesiCost;

                await _dbContext.SaveChangesAsync();
                return $"{existingCarrier.CarrierId} ID'li kargo firma güncellendi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in UpdateCarrierAsync: {ex.Message}");
                throw;
            }
        }


    }
}
