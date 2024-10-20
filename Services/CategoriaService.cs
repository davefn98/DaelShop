using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DaelShop.Data;
using DaelShop.Models;
using Microsoft.EntityFrameworkCore;

namespace DaelShop.Services
{
    public class CategoriaService : ICategoriaService
    {
        private readonly ApplicationDbContext _context;

        public CategoriaService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<Categoria>> GetCategorias()
        {
            return await _context.Categorias.ToListAsync();
        }
    }
}