using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace someting.DataLayer
{
    public class DockerSqlServer : DbContext
    {
        public DockerSqlServer(DbContextOptions options)
           : base(options)
        {
        }
        public DbSet<DockerSqlModel> sqlModels { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DockerSqlModel>().HasData(new DockerSqlModel { id = 143, name = "yolo" }, new DockerSqlModel { id=122,name="poo"});
        }

    }

}
