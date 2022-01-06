using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using CITOWebApp.Models;

namespace CITOWebApp.Data
{
    public class CITOWebAppContext : DbContext
    {
        public CITOWebAppContext (DbContextOptions<CITOWebAppContext> options)
            : base(options)
        {
        }

        public DbSet<CITOWebApp.Models.Movie> Movie { get; set; }
    }
}
