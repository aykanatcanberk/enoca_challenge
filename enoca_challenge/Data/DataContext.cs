using enoca_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Data
{
    public class DataContext:DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }

        DbSet<Carrier> Carriers { get; set; }
        DbSet<CarrierConfiguration> CarriersConfigurations { get; set;}
        DbSet<Order> Orders { get; set; }
    }
}
