using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DaelShop.Models.ViewModel
{
    public class ProductosPaginadosViewModel
    {
        public  List<Producto> Productos {get;set;} = null!;

        public int PaginaActual { get; set; }

        public int TotalPaginas { get; set; }

        public int? CategoriaIdSeleccionada { get; set; }
        
        public string? Busqueda { get; set; }

        public bool MostrarMensajeSinResultado { get; set; }

        public string? NombreCategoriaSeleccionada { get; set; }
    }
}