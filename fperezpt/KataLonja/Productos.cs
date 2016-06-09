
namespace KataLonja
{
    public class Producto
    {
        public string Nombre { get; private set; }
        public int Kilos { get; private set; }

        public Producto(string nombre, int kilos=0)
        {
            Nombre = nombre;
            Kilos = kilos;
        }
    }
}
