using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DaelShop.Models;

namespace DaelShop.Services
{
    public interface ICategoriaService
    {
        Task<List<Categoria>> GetCategorias();
    }
}