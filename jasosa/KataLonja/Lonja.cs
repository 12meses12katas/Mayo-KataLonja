using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class Lonja
    {
        /// <summary>
        /// Ciudad de la lonja
        /// </summary>
        public NombreCiudad Ciudad { get; set; }

        /// <summary>
        /// Distancia en Km desde Santiago
        /// </summary>
        public float Distancia { get; set; }

        /// <summary>
        /// Precios de compra de los diferentes productos en la lonja
        /// </summary>
        public List<ValorDeCompra> Precios { get; set; }

        internal float CalculaPrecioVenta(Carga carga, Depreciación depreciacion)
        {
            float precioVentaTotal = 0;
            foreach (ValorDeCompra precioPorProducto in Precios)
            {
                precioVentaTotal += carga.Peso(precioPorProducto.Producto) * depreciacion.Calcula(Distancia, precioPorProducto.Importe);                
            }

            return precioVentaTotal;
        }
    }
}
