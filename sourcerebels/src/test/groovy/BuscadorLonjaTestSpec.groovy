import spock.lang.Specification;

class BuscadorLonjaTestSpec extends Specification {
	
	BuscadorLonja buscador
	
	def "setup"() {
		
		buscador = new BuscadorLonja()

		buscador.lonjas = [new LonjaMadrid(),
			               new LonjaBarcelona(),
			               new LonjaLisboa()]

		buscador.cargamento = new Cargamento(
							kgVieiras: 50,
							kgPulpo: 100,
							kgCentollo: 50)
	}
	
	def "buscar lonja por maximo beneficio"() {
		
		expect:
			buscador.porMaximoBeneficio().nombre == "Lisboa"
		
	}
}
