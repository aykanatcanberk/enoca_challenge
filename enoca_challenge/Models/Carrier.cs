namespace enoca_challenge.Models
{
    public class Carrier
    {
        public int CarrierId { get; set; }
        public string CarrierName { get; set;}
        public bool CarrierIsActive {  get; set; }
        public int CarrierPlusDesiCost {  get; set; }
        public int CarrierConfigurationId {  get; set; }

        public List<Order> Orders { get; set; }
        public List<CarrierConfiguration> CarrierConfigurations { get; set; }

    }
}
