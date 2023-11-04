using enoca_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace enoca_challenge.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
        public DbSet<Carrier> Carriers { get; set; }
        public DbSet<CarrierConfiguration> CarriersConfigurations { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<CarrierReport> CarrierReports { get; set; }
    }
}