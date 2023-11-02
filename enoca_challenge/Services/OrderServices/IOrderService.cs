using enoca_challenge.Models;

namespace enoca_challenge.Services.OrderServices
{
    public interface IOrderService
    {
        List<Order> GetOrders();
        void AddOrder(Order order);
        void ProcessOrder(int orderId);
        void DeleteOrder(int orderId);
    }
}
