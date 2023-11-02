﻿namespace enoca_challenge.Models
{
    public class Order
    {
        public int OrderId { get; set; }
        public int CarrierId { get; set; }
        public int OrderDesi {  get; set; }
        public DateOnly OrderDate { get; set; }
        public decimal OrderCarrierCost {  get; set; }

        public Carrier Carrier { get; set; }
    }

}