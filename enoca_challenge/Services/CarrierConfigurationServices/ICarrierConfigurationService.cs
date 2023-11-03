using enoca_challenge.DTOs.Request.CarrierConfigurationRequest;
using enoca_challenge.DTOs.Response.CarrierConfigurationResponse;

namespace enoca_challenge.Services.CarrierConfigurationServices
{
    public interface ICarrierConfigurationService
    {
        Task<List<ListCarrierConfigurationResponse>> ListCarrierConfigurationsAsync();
        Task<string> AddCarrierConfigurationAsync(AddCarrierConfigurationRequest addRequest);
        Task<string> UpdateCarrierConfigurationAsync(int carrierConfigurationId, UpdateCarrierConfigurationRequest updateRequest);
        Task<string> DeleteCarrierConfigurationAsync(int carrierConfigurationId);
    }
}
