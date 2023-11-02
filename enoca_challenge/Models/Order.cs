using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace enoca_challenge.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        [ForeignKey("Carrier")]
        public int CarrierId { get; set; }
        public int OrderDesi {  get; set; }
        public DateTime OrderDate { get; set; }
        public decimal OrderCarrierCost {  get; set; }

        public Carrier Carrier { get; set; }
        
    }

}
