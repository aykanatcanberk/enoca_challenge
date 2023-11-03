namespace enoca_challenge.DTOs.Response.OrderResponse
{
    public class ListOrderResponse
    {
        public int OrderId { get; set; }
        public int OrderDesi { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal OrderCarrierCost { get; set; }
    }
}
