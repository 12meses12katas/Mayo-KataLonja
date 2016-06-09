using System;
using System.Collections.Generic;
using System.Linq;

namespace KataLonja
{
    public class Furgoneta
    {
        List<Ciudad> listaCiudades = new List<Ciudad>();
        List<Producto> listaProductos = new List<Producto>();
        Dictionary<Ciudad, Dictionary<Producto, int>> listaPreciosKg = new Dictionary<Ciudad, Dictionary<Producto,int>>();
        int capacidadFurgoneta;
        int gtosCargarFurgoneta;
        int gtosPorKm;

        public List<Ciudad> Ciudades
        {
            get
            {
                return listaCiudades;
            }
        }
        public List<Producto> Productos
        {
            get
            {
                return listaProductos;
            }
        }


        public decimal GetGastosFijosPorIrA(Ciudad ciudad) {
            var gtoskm = (ciudad.Kilometros * gtosPorKm);
            var depreciacionPorCada100Km = (GetValorBrutoProductosEn(ciudad) * 1 / 100);
            var depreciacionTotal = depreciacionPorCada100Km * (ciudad.Kilometros / 100);
            return gtosCargarFurgoneta +
                   gtoskm +
                   depreciacionTotal;


        }

        public int GetValorBrutoProductosEn(Ciudad ciudad)
        {
            int result = 0;
            if (listaPreciosKg.ContainsKey(ciudad)) {
                result += listaPreciosKg[ciudad].Sum(x => x.Value * x.Key.Kilos);
            } else {
                result = 0;
            }
            return result;

        }

        public decimal GetValorNetoProductosEn(Ciudad ciudad)
        {
            return GetValorBrutoProductosEn(ciudad) - GetGastosFijosPorIrA(ciudad);
        }


        public Ciudad GetMejorCiudadParaVenta()
        {
            Ciudad result = listaCiudades.First();
            foreach (Ciudad c in listaCiudades) {
                if (this.GetValorNetoProductosEn(result) < this.GetValorNetoProductosEn(c)) {
                    result = c;
                }
            }
            return result;
        }


        public void AddPrecio(Ciudad ciudad, Producto producto, int precio)
        {
            if (!listaProductos.Exists(x => x.Equals(producto))) {
                NuevoProducto(producto);
            }
            if (!listaCiudades.Exists(x => x.Equals(ciudad))) {
                NuevaCiudad(ciudad);
            }
            SetPrecio(ciudad, producto, precio);
        }

        public int GetPrecio(Ciudad ciudad, Producto producto)
        {
            return listaPreciosKg[ciudad][producto];
        }

        public Dictionary<Producto, int> GetPreciosCiudad(Ciudad ciudad)
        {
            if (listaPreciosKg.ContainsKey(ciudad)) {
                return listaPreciosKg[ciudad];
            } else {
                return new Dictionary<Producto, int>();
            }
        }

        public Dictionary<Ciudad, int> GetPreciosProducto(Producto producto)
        {
            var temp = new Dictionary<Ciudad, int>();

            foreach (Ciudad c in listaPreciosKg.Keys) {
                foreach (Producto p in listaPreciosKg[c].Keys) {
                    if (p.Equals(producto)) {
                        temp.Add(c, listaPreciosKg[c][p]);                    
                    }
                }
            }
            return temp;
        }

        public int CargaActual()
        {
            int result = 0;
            foreach (Producto p in listaProductos) {
                result += p.Kilos;
            }
            return result;
        }



        private void SetPrecio(Ciudad ciudad, Producto producto, int precio)
        {
            if (listaPreciosKg.ContainsKey(ciudad)) {
                if (listaPreciosKg[ciudad].ContainsKey(producto)) {
                    listaPreciosKg[ciudad][producto] = precio;
                } else {
                    listaPreciosKg[ciudad].Add(producto, precio);
                }
            } else {                
                listaPreciosKg.Add(ciudad, new Dictionary<Producto,int>() { {producto, precio} });
            }
        }
                
        private void NuevoProducto(Producto producto)
        {
            if (CargaActual() + producto.Kilos <= capacidadFurgoneta) {
                listaProductos.Add(producto);
            } else {
                throw new Exception("La carga actual: " + Convert.ToString(CargaActual()) +
                                    " + la carga del nuevo producto: " + Convert.ToString(producto.Kilos) +
                                    " sobrepasaria la carga permitida de " + capacidadFurgoneta.ToString());
            }
        }

        private void NuevaCiudad(Ciudad ciudad)
        {
            listaCiudades.Add(ciudad);
        }       



        public Furgoneta(int capacidadFurgoneta, int gtosCargarFurgoneta=5, int gtosKmRecorrido=2)
        {
            this.capacidadFurgoneta = capacidadFurgoneta;
            this.gtosCargarFurgoneta = gtosCargarFurgoneta;
            this.gtosPorKm = gtosKmRecorrido;
        }

    }
}
