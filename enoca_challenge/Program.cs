global using enoca_challenge.Data;
global using Microsoft.EntityFrameworkCore;
global using enoca_challenge.DTOs;
using enoca_challenge.Models;
using enoca_challenge.Services.CarrierConfigurationServices;
using enoca_challenge.Services.CarrierServices;
using enoca_challenge.Services.OrderServices;
using Hangfire;
using enoca_challenge.Services.HangfireServices;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Services
builder.Services.AddScoped<ICarrierService, CarrierService>();
builder.Services.AddScoped<IOrderService, OrderService>();
builder.Services.AddScoped<ICarrierConfigurationService,CarrierConfigurationService>();
builder.Services.AddScoped<IHangfireService, HangfireService>(); 

//DB Connection
builder.Services.AddDbContext<DataContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("local");
    options.UseSqlServer(connectionString);
}
);

// Hangfire Configuration
builder.Services.AddHangfire(config => config
.UseSqlServerStorage(builder.Configuration.GetConnectionString("local")));

builder.Services.AddHangfireServer();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseHangfireDashboard();
app.MapHangfireDashboard();
RecurringJob.AddOrUpdate<IHangfireService>(x => x.GenerateCarrierReportsJob(), Cron.Daily);

app.Run();
