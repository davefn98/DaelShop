using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DaelShop.Models;
using DaelShop.Models.ViewModel;

namespace DaelShop.Services
{
    public interface IProductoService
    {
        Producto GetProducto(int id);

        Task<List<Producto>> GetProductosDestacados();

        Task<ProductosPaginadosViewModel> GetProductosPaginados(int? categoriaId, string? busqueda, int pagina, int productosPorPagina);
    }
}