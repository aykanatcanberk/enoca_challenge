using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace enoca_challenge.Models
{
    public class CarrierConfiguration
    {
        [Key]
        public int CarrierConfigurationId { get; set; }
        [ForeignKey("Carrier")]
        public int CarrierId { get; set; }
        public int CarrierMaxDesi {  get; set; }
        public int CarrierMinDesi { get; set; }
        public decimal CarrierCost {  get; set; }

        public Carrier Carrier { get; set; }

        
    }
}
