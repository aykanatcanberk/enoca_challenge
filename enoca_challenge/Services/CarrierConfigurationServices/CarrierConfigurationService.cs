using enoca_challenge.DTOs.Request.CarrierConfigurationRequest;
using enoca_challenge.DTOs.Response.CarrierConfigurationResponse;
using enoca_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Services.CarrierConfigurationServices
{
    public class CarrierConfigurationService : ICarrierConfigurationService
    {
        private readonly DataContext _dbContext;

        public CarrierConfigurationService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<string> AddCarrierConfigurationAsync(AddCarrierConfigurationRequest addRequest)
        {
            try
            {
                var configuration = new CarrierConfiguration
                {
                    CarrierId = addRequest.CarrierId,
                    CarrierMaxDesi = addRequest.CarrierMaxDesi,
                    CarrierMinDesi = addRequest.CarrierMinDesi,
                    CarrierCost = addRequest.CarrierCost
                };

                _dbContext.CarriersConfigurations.Add(configuration);
                await _dbContext.SaveChangesAsync();

                return "Kargo Firması Konfigürasyonu Eklendi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in AddCarrierConfigurationAsync: {ex.Message}");
                throw;
            }
        }
        public async Task<string> DeleteCarrierConfigurationAsync(int carrierConfigurationId)
        {
            try
            {
                var existingConfiguration = await _dbContext.CarriersConfigurations.FindAsync(carrierConfigurationId);
                if (existingConfiguration == null)
                    return "Belirtilen ID'ye sahip kargo firma konfigürasyonu bulunamadı";

                _dbContext.CarriersConfigurations.Remove(existingConfiguration);
                await _dbContext.SaveChangesAsync();

                return $"{existingConfiguration.CarrierConfigurationId} ID'li kargo firma konfigürasyonu silindi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in DeleteCarrierConfigurationAsync: {ex.Message}");
                throw;
            }
        }
        public async Task<List<ListCarrierConfigurationResponse>> ListCarrierConfigurationsAsync()
        {
            var configurations = await _dbContext.CarriersConfigurations.ToListAsync();
            try 
            {
                var responseList= configurations.Select(c => new ListCarrierConfigurationResponse
                {
                    CarrierConfigurationId = c.CarrierConfigurationId,
                    CarrierId = c.CarrierId,
                    CarrierMaxDesi = c.CarrierMaxDesi,
                    CarrierMinDesi = c.CarrierMinDesi,
                    CarrierCost = c.CarrierCost
                }).ToList();
                return responseList;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in ListCarrierConfigurationAsync: {ex.Message}");
                throw;
            }

        }

        public async Task<string> UpdateCarrierConfigurationAsync(int carrierConfigurationId, UpdateCarrierConfigurationRequest updateRequest)
        {
            try
            {
                var existingConfiguration = await _dbContext.CarriersConfigurations.FindAsync(carrierConfigurationId);
                if (existingConfiguration == null)
                    return "Belirtilen ID'ye sahip kargo firma konfigürasyonu bulunamadı";

                existingConfiguration.CarrierMaxDesi = updateRequest.CarrierMaxDesi;
                existingConfiguration.CarrierMinDesi = updateRequest.CarrierMinDesi;
                existingConfiguration.CarrierCost = updateRequest.CarrierCost;

                await _dbContext.SaveChangesAsync();
                return $"{existingConfiguration.CarrierConfigurationId} ID'li kargo firma konfigürasyonu güncellendi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in UpdateCarrierConfigurationAsync: {ex.Message}");
                throw;
            }
        }
    }
}
