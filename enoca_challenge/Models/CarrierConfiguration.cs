namespace enoca_challenge.Models
{
    public class CarrierConfiguration
    {
        public int CarrierConfigurationId { get; set; }
        public int CarrierId {  get; set; }
        public int CarrierMaxDesi {  get; set; }
        public int CarrierMinDesi { get; set; }
        public decimal CarrierCost {  get; set; }

        public Carrier Carrier { get; set; }
    }
}
