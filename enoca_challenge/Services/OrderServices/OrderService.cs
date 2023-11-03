using enoca_challenge.Data;
using enoca_challenge.DTOs.Response.OrderResponse;
using enoca_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Services.OrderServices
{
    public class OrderService : IOrderService
    {
        public readonly DataContext _dbContext;

        public OrderService(DataContext context)
        {
            _dbContext = context;
        }
        public async Task<string> DeleteOrderAsync(int orderId)
        {
            try
            {
                var order = await _dbContext.Orders.FindAsync(orderId);
                if (order == null)
                    return $"Belirtilen ID'ye sahip sipariş bulunamadı";

                _dbContext.Orders.Remove(order);
                await _dbContext.SaveChangesAsync();

                return $"{orderId} ID'li sipariş silindi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in DeleteOrderAsync: {ex.Message}");
                throw;
            }
        }

        public async Task<List<ListOrderResponse>> ListOrdersAsync()
        {
            try
            {
                var orders = await _dbContext.Orders.ToListAsync();

                var responseList = orders.Select(o => new ListOrderResponse
                {
                    OrderId = o.OrderId,
                    OrderDesi = o.OrderDesi,
                    OrderDate = o.OrderDate,
                    OrderCarrierCost = o.OrderCarrierCost
                }).ToList();

                return responseList;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in ListOrdersAsync: {ex.Message}");
                throw;
            }
        }
        public async Task<string> AddOrderAsync(int orderDesi)
        {
            try
            {
                var order = new Order
                {
                    OrderDesi = orderDesi,
                    OrderDate = DateTime.Now
                };

                var carriersWithEligibleConfigurations = await _dbContext.Carriers
                    .Include(c => c.CarrierConfigurations)
                    .Where(c => c.CarrierConfigurations.Any(config => orderDesi >= config.CarrierMinDesi && orderDesi <= config.CarrierMaxDesi))
                    .ToListAsync();

                if (!carriersWithEligibleConfigurations.Any())
                {
                    // Sipariş desisi hiçbir kargo firmasının MinDesi-MaxDesi aralığına girmiyorsa
                    return "Siparişin desi değeri hiçbir kargo firmasının aralığına uymuyor.";
                }

                // En ucuz kargo firmasını seç
                var cheapestCarrier = carriersWithEligibleConfigurations
                    .OrderBy(c => c.CarrierConfigurations
                        .Where(config => orderDesi >= config.CarrierMinDesi && orderDesi <= config.CarrierMaxDesi)
                        .Min(config => config.CarrierCost))
                    .First();

                var cheapestConfiguration = cheapestCarrier.CarrierConfigurations
                    .Where(config => orderDesi >= config.CarrierMinDesi && orderDesi <= config.CarrierMaxDesi)
                    .OrderBy(config => config.CarrierCost)
                    .First();

                order.CarrierId = cheapestCarrier.CarrierId;
                order.OrderCarrierCost = cheapestConfiguration.CarrierCost;

                _dbContext.Orders.Add(order);
                await _dbContext.SaveChangesAsync();

                return "Sipariş eklendi";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in AddOrderAsync: {ex.Message}");
                throw;
            }
        }

        public async Task<decimal> AddOrderAsync(OrderDto orderDto)
        {

            return await CalculateOrderCarrierCostAsync(orderDto.OrderDesi);
        }

        public async Task<decimal> CalculateOrderCarrierCostAsync(int orderDesi)
        {
            var carriers = await _dbContext.Carriers.Include(c => c.CarrierConfigurations).ToListAsync();

            if (carriers.Any())
            {
                var matchingConfigurations = carriers
                    .SelectMany(c => c.CarrierConfigurations.Where(conf => orderDesi >= conf.CarrierMinDesi && orderDesi <= conf.CarrierMaxDesi)
                        .Select(conf => new
                        {
                            CarrierId = c.CarrierId,
                            Configuration = conf,
                            Cost = conf.CarrierCost
                        }))
                    .OrderBy(item => item.Cost)
                    .FirstOrDefault();

                if (matchingConfigurations != null)
                {
                    var order = new Order
                    {
                        CarrierId = matchingConfigurations.CarrierId,
                        OrderDesi = orderDesi,
                        OrderDate = DateTime.Now,
                        OrderCarrierCost = matchingConfigurations.Cost
                    };

                    _dbContext.Orders.Add(order);
                    await _dbContext.SaveChangesAsync();

                    return matchingConfigurations.Cost;
                }
                else
                {
                    var nearestConfiguration = carriers
                        .SelectMany(c => c.CarrierConfigurations.Select(conf => new
                        {
                            CarrierId = c.CarrierId,
                            Configuration = conf,
                            DesiDifference = Math.Min(Math.Abs(orderDesi - conf.CarrierMinDesi), Math.Abs(orderDesi - conf.CarrierMaxDesi))
                        }))
                        .OrderBy(item => item.DesiDifference)
                        .FirstOrDefault();

                    if (nearestConfiguration != null)
                    {
                        int desiDifference = nearestConfiguration.DesiDifference;
                        decimal additionalCost = carriers.First(c => c.CarrierId == nearestConfiguration.CarrierId).CarrierPlusDesiCost * desiDifference;

                        var order = new Order
                        {
                            CarrierId = nearestConfiguration.CarrierId,
                            OrderDesi = orderDesi,
                            OrderDate = DateTime.Now,
                            OrderCarrierCost = nearestConfiguration.Configuration.CarrierCost + additionalCost
                        };

                        _dbContext.Orders.Add(order);
                        await _dbContext.SaveChangesAsync();

                        return nearestConfiguration.Configuration.CarrierCost + additionalCost;
                    }
                }
            }

            return 0;
        }
    }
}
