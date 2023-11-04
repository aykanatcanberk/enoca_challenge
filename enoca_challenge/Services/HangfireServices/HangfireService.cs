using enoca_challenge.Models;
using enoca_challenge.Services.CarrierServices;

namespace enoca_challenge.Services.HangfireServices
{
    public class HangfireService : IHangfireService
    {
        private readonly DataContext _dbContext;
        private readonly ICarrierService _carrierService;

        public HangfireService(DataContext dbContext, ICarrierService carrierService)
        {
            _dbContext = dbContext;
            _carrierService = carrierService;
        }
        public async Task GenerateCarrierReportsJob()
        {
            try
            {
                var ordersGroupedByCarrierAndDate = await _dbContext.Orders
                    .Include(o => o.Carrier)
                    .GroupBy(o => new { o.CarrierId, o.OrderDate.Date })
                    .Select(g => new
                    {
                        CarrierId = g.Key.CarrierId,
                        OrderDate = g.Key.Date,
                        TotalCost = g.Sum(o => o.OrderCarrierCost)
                    })
                    .ToListAsync();

                foreach (var orderGroup in ordersGroupedByCarrierAndDate)
                {
                    var carrierReport = await _dbContext.CarrierReports
                        .FirstOrDefaultAsync(cr => cr.CarrierId == orderGroup.CarrierId && cr.CarrierReportTime.Date == orderGroup.OrderDate);

                    if (carrierReport == null)
                    {
                        carrierReport = new CarrierReport
                        {
                            CarrierId = orderGroup.CarrierId,
                            CarrierCost = orderGroup.TotalCost,
                            CarrierReportTime = orderGroup.OrderDate
                        };

                        _dbContext.CarrierReports.Add(carrierReport);
                    }
                    else
                    {
                        carrierReport.CarrierCost += orderGroup.TotalCost;
                    }
                }

                await _dbContext.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in GenerateCarrierReportsJob: {ex.Message}");
                throw;
            }

        }
    }
}
