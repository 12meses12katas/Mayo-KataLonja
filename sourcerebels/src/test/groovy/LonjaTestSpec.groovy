import spock.lang.Specification;

class LonjaTestSpec extends Specification {
	
	def cargamento
	
	
	def "setup"() {

		cargamento = new Cargamento(
							kgVieiras: 50,
							kgPulpo: 100,
							kgCentollo: 50)
	}

	def "calculo del precio bruto"() {
		
		expect:
			lonja.calcularPrecioVentaBruto(cargamento) == precioVenta
		where:
			lonja                | precioVenta
			new LonjaMadrid()    | 47500
			new LonjaBarcelona() | 34500
			new LonjaLisboa()    | 65000
	}
	
	def "calculao del coste por km"() {
		
		expect:
			lonja.calcularCostePorKm() == costePorKm
		where:
			lonja                | costePorKm
			new LonjaMadrid()    | 1600
			new LonjaBarcelona() | 2200
			new LonjaLisboa()    | 1200
	}
	
	def "calculao del coste total"() {
		
		expect:
			lonja.calcularCosteTotal() == costeTotal
		where:
			lonja                | costeTotal
			new LonjaMadrid()    | 1605
			new LonjaBarcelona() | 2205
			new LonjaLisboa()    | 1205
	}
	
	def "calculo de la perdida de valor"() {
		
		expect:
			lonja.calcularPerdidaDeValor(cargamento) == perdidaDeValor
		where:
			lonja                | perdidaDeValor
			new LonjaMadrid()    | 3800
			new LonjaBarcelona() | 3795
			new LonjaLisboa()    | 3900
	}
	
	def "calculo del beneficio"() {
		
		expect:
			lonja.calcularBeneficio(cargamento) == beneficio
		where:
			lonja                | beneficio
			new LonjaMadrid()    | 42095
			new LonjaBarcelona() | 28500
			new LonjaLisboa()    | 59895
	}
}

