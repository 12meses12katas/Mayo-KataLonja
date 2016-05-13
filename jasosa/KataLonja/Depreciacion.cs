using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    /// <summary>
    /// Clase que calcula la depreciación de un producto por cada 100km
    /// de distancia dado un porcentaje de depreciación, 
    /// el precio actual del producto y la distancia a recorrer
    /// </summary>
    public class Depreciación
    {
        float porcentaje = 0;

        /// <summary>
        /// Constructor de la clase Depreciación
        /// </summary>
        /// <param name="porcentaje">Porcentjae de depreciación de la carga cada 100km</param>
        public Depreciación(float porcentaje)
        {
            this.porcentaje = porcentaje;
        }

        /// <summary>
        /// Devuelve el importe de depreciar precioActual el valor de
        /// porcentaje por cada 100km en función de la distancia a recorrer
        /// </summary>        
        /// <param name="distancia">Distancia que ha de recorrer la carga</param>
        /// <param name="precioActual">Precio inicial de la carga</param>
        /// <returns></returns>
        public float Calcula(float distancia, float precioActual)
        {
            var porcentajeTotalDepreciación = (porcentaje * distancia) / 100;
            var depreciación = (porcentajeTotalDepreciación * precioActual)  / 100;
            var precioDepreciado = precioActual - depreciación;
            return Math.Max(0, precioDepreciado);
        }
    }
}
