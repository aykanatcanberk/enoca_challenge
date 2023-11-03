using enoca_challenge.DTOs.Response.OrderResponse;
using enoca_challenge.Models;

namespace enoca_challenge.Services.OrderServices
{
    public interface IOrderService
    {
        Task<string> AddOrderAsync(int orderDesi);
        Task<List<ListOrderResponse>> ListOrdersAsync();
         Task<string> DeleteOrderAsync(int orderId);
         Task<decimal> AddOrderAsync(OrderDto orderDto);
         Task<decimal> CalculateOrderCarrierCostAsync(int orderDesi);

    }
}
