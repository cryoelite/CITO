using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using CITOWebApp.Data;
using CITOWebApp.Models;

namespace CITOWebApp.Pages.Movies
{
    public class IndexModel : PageModel
    {
        private readonly CITOWebApp.Data.CITOWebAppContext _context;

        public IndexModel(CITOWebApp.Data.CITOWebAppContext context)
        {
            _context = context;
        }

        public IList<Movie> Movie { get;set; }

        public async Task OnGetAsync()
        {
            Movie = await _context.Movie.ToListAsync();
        }
    }
}
