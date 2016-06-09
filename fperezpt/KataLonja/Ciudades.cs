
namespace KataLonja
{
    public class Ciudad
    {
        public string Nombre { get; private set; }
        public int Kilometros { get; private set; }
        
        public Ciudad(string nombre, int kilometros=0)
        {
            Nombre = nombre;
            Kilometros = kilometros;
        }
    }
}
