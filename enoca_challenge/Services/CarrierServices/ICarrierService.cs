using enoca_challenge.DTOs.Request.CarrierRequest;
using enoca_challenge.DTOs.Response.CarrierResponse;
using enoca_challenge.Models;

namespace enoca_challenge.Services.CarrierServices
{
    public interface ICarrierService
    {
        Task<List<ListCarriersResponse>> ListCarriersAsync();
        Task<string> AddCarrierAsync(AddCarrierRequest newCarrier);
        Task<string> UpdateCarrierAsync(int carrierId, UpdateCarrierRequest updateRequest);
        Task<string> DeleteCarrierAsync(int carrierId);
    }
}
