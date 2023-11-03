using enoca_challenge.DTOs.Request.OrderRequest;
using enoca_challenge.Models;
using enoca_challenge.Services.OrderServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace enoca_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService _orderService;

        public OrderController(IOrderService orderService)
        {
            _orderService = orderService;
        }
        [HttpGet]
        public async Task<IActionResult> ListOrders()
        {

            var orders = await _orderService.ListOrdersAsync();
            return Ok(orders);
        }

        [HttpDelete("{orderId}")]
        public async Task<IActionResult> DeleteOrder(int orderId)
        {
            var result = await _orderService.DeleteOrderAsync(orderId);
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddOrder([FromBody] OrderDto orderDto)
        {
            try
            {
                var orderCarrierCost = await _orderService.AddOrderAsync(orderDto);
                return Ok($"Order added successfully. CarrierCost: {orderCarrierCost}");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error adding order: {ex.Message}");
            }
        }
    }
}
