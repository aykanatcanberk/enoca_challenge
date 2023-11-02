using enoca_challenge.Data;
using enoca_challenge.Models;

namespace enoca_challenge.Services.OrderServices
{
    public class OrderService : IOrderService
    {
        public readonly DataContext _context;

        public OrderService(DataContext context)
        {
            _context = context;
        }

        public void AddOrder(Order order)
        {
            _context.Orders.Add(order);
            _context.SaveChanges();
        }

        public void DeleteOrder(int orderId)
        {
            var order = _context.Orders.Find(orderId);
            if (order != null)
            {
                _context.Orders.Remove(order);
                _context.SaveChanges();
            }
        }

        public List<Order> GetOrders()
        {
            throw new NotImplementedException();
        }

        public void ProcessOrder(int orderId)
        {
            throw new NotImplementedException();
        }

    }
}
