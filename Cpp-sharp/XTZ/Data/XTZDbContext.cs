using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using XTZ.Models;

namespace XTZ.Data
{
    public class XTZDbContext : DbContext
    {
        public XTZDbContext(DbContextOptions<XTZDbContext> options)
            : base(options)
        {
        }

        public DbSet<ItemModel> Items { get; set; }
    }
}
