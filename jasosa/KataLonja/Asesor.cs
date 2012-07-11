using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class Asesor
    {
        public NombreCiudad DondeVender(Carga carga, List<Lonja> lonjas, GastoFurgoneta gastoFurgoneta, Depreciación depreciacion)
        {
            NombreCiudad ciudadOptima = NombreCiudad.Ninguna;
            float precioVentaMáximo = 0;

            foreach (Lonja lonja in lonjas)
            {  
                var precioTotalventa = lonja.CalculaPrecioVenta(carga, depreciacion);
                var beneficios = precioTotalventa - gastoFurgoneta.Calcula(lonja.Distancia);

                if (beneficios > precioVentaMáximo || precioVentaMáximo == 0)
                {
                    precioVentaMáximo = beneficios;
                    ciudadOptima = lonja.Ciudad;
                }
            }
          
            return ciudadOptima;
        }
    }
}
