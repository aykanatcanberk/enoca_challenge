namespace enoca_challenge.DTOs.Request.CarrierRequest
{
    public class AddCarrierRequest
    {
        public string CarrierName { get; set; }
        public bool CarrierIsActive { get; set; }
        public int CarrierPlusDesiCost { get; set; }
    }
}
