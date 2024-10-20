using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DaelShop.Models.ViewModel
{
    public class CarritoViewModel
    {
        public List<CarritoItemViewModel> Items { get; set; } = new List<CarritoItemViewModel>();

        public decimal Total { get; set; }
    }
}