using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    /// <summary>
    /// Representa la carga que lleva la furgoneta
    /// </summary>
    public class Carga
    {
        Dictionary<string, float> _carga;        

        public Carga()
        {
            _carga = new Dictionary<string, float>();            
        }

        public void Add(string producto, float peso)
        {
            _carga.Add(producto, peso);
        }

        public bool ExisteProducto (string producto)
        {
            return _carga.ContainsKey(producto);
        }

        public ICollection<string> Productos
        {
            get { return _carga.Keys; }
        }

        public bool Elimina(string producto)
        {
            return _carga.Remove(producto);
        }

        public float Peso(string producto)
        { 
            return _carga[producto];
        }
        
    }
}
