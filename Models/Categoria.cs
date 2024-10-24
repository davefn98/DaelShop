using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DaelShop.Models
{
    public class Categoria
    {
        public Categoria(){
            Productos = new List<Producto>();
        }
        
        [Key]
        public int CategoriaId { get; set; }

        [Required(ErrorMessage = "El campo Nombre es Obligatorio")]
        [StringLength(100)]
        public string Nombre { get; set; } = null!;

        [Required]
        [StringLength(1000)]
        public string Descripcion { get; set; } = null!;

        public ICollection<Producto> Productos { get; set; } = null!;
    }
}