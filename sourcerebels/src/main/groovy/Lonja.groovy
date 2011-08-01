
abstract class Lonja {

	def nombre
	
	def precioKgVieiras
	def precioKgPulpo
	def precioKgCentollo
	
	def distanciaEnKm
	
	final static COSTE_FIJO_EN_EUROS = 5
	final static COSTE_KM_EN_EUROS = 2
	final static PORCENTAJE_PERDIDA_EUROS_POR_KM = 1

	def calcularPrecioVentaBruto(Cargamento cargamento) {

		return (cargamento.kgVieiras * precioKgVieiras) +
               (cargamento.kgPulpo * precioKgPulpo) +
			   (cargamento.kgCentollo * precioKgCentollo)
	}
	
	def calcularCostePorKm() {
		return COSTE_KM_EN_EUROS * distanciaEnKm
	}
	
	def calcularCosteTotal() {
		return COSTE_FIJO_EN_EUROS + calcularCostePorKm()
	}
	
	def calcularPerdidaDeValor(Cargamento cargamento) {
		
		def precioVentaBruto = calcularPrecioVentaBruto(cargamento)
		
		def porcentajePerdida =
			distanciaEnKm * PORCENTAJE_PERDIDA_EUROS_POR_KM / 100
		
		return precioVentaBruto * porcentajePerdida / 100
		
	}
	
	def calcularBeneficio(Cargamento cargamento) {
		
		def precioVentaBruto = calcularPrecioVentaBruto(cargamento)
		def costeTotal = calcularCosteTotal()
		def perdidaValor = calcularPerdidaDeValor(cargamento)
		
		return precioVentaBruto - costeTotal - perdidaValor
	}
}

class LonjaMadrid extends Lonja {

	LonjaMadrid() {
	
		nombre = "Madrid"
		distanciaEnKm = 800
		
		precioKgVieiras = 500
		precioKgPulpo = 0
		precioKgCentollo = 450	
	}	
}

class LonjaBarcelona extends Lonja {
	
	LonjaBarcelona() {
	
		nombre = "Barcelona"
		distanciaEnKm = 1100
		
		precioKgVieiras = 450
		precioKgPulpo = 120
		precioKgCentollo = 0
	}
}

class LonjaLisboa extends Lonja {
	
	LonjaLisboa() {
	
		nombre = "Lisboa"
		distanciaEnKm = 600
		
		precioKgVieiras = 600
		precioKgPulpo = 100
		precioKgCentollo = 500
	}
}

class Cargamento {
	
	def kgVieiras
	def kgPulpo
	def kgCentollo
}