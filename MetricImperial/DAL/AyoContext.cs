
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MetricImperial.Model;
using Microsoft.EntityFrameworkCore;

namespace MetricImperial.DAL
{
    public class AyoContext : DbContext
    {
        public DbSet<Unit> Units { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ConversionAudit> ConversionAudits { get; set; }
        public DbSet<UserAudit> UserAudits { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) 
             => optionsBuilder.UseNpgsql("Host=localhost;Database=ayotestdb;Username=postgres;Password=Password01");
    }
}
