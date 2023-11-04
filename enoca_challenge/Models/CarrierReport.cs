using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace enoca_challenge.Models
{
    public class CarrierReport
    {
        [Key]
        public int CarrierReportId { get; set; }

        [ForeignKey("Carrier")]
        public int CarrierId { get; set; }
        public decimal CarrierCost {  get; set; }
        public DateTime CarrierReportTime { get; set; }

        public Carrier Carrier { get; set; }

    }
}
