using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DaelShop.Models.ViewModel
{
    public class CarritoItemViewModel
    {
        public int ProductoId { get; set; }

        public Producto Producto { get; set; } = null!;

        public string Nombre { get; set; } = null!;

        public decimal Precio { get; set; }

        public int Cantidad { get; set; }

        public decimal Subtotal => Precio * Cantidad;
    }
}