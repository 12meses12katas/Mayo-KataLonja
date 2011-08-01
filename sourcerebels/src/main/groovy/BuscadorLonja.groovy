
class BuscadorLonja {

	def lonjas = []
	def cargamento
	
	def porMaximoBeneficio() {
		
		def maximoBeneficio = 0
		def lonjaEscogida 
		
		for (lonja in lonjas) {
			
			def beneficioLonja = lonja.calcularBeneficio(cargamento)
			if (beneficioLonja > maximoBeneficio) {
				
				maximoBeneficio = beneficioLonja
				lonjaEscogida = lonja
			}
		}
		return lonjaEscogida
	}
	
}
