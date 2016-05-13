using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class GastoFurgoneta
    {
        public GastoFurgoneta()
        {
            Fijo = 0;
            PorKilometro = 0;
        }
    
        public float Fijo { get; set; }
        public float PorKilometro { get; set; }

        public float Calcula(float distancia)
        {
            return Fijo + (distancia * PorKilometro);
        }
    }
}
