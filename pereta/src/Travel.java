import java.util.Map;


public class Travel {

	private Van theVan;
	private City destinationCity;
	
	public Travel(Van theVan, City destinationCity) {
		this.theVan = theVan;
		this.destinationCity = destinationCity;
	}

	public double calculateProfit() throws Exception {
		if(vanOverload())
			throw new Exception("Exceso de carga en la furgoneta");
		double valueOfTheProducts = calculateValueOfTheProducts();
		double costsOfVan = calculateCostOfVan();
		double degradationOfProducts = calculateDegradation(valueOfTheProducts);
		return valueOfTheProducts - costsOfVan - degradationOfProducts;
	}

	private boolean vanOverload() {
		double totalCharge = 0;
		
		for (Map.Entry<Integer, Double> product : this.theVan.getProducts().entrySet()) {
			totalCharge += product.getValue();
		}
		
		return totalCharge > this.theVan.getMaximumLoadInKg();
	}

	private double calculateDegradation(double valueOfTheProducts) {
		double factorOfDegradation = this.destinationCity.getDistanceInKm()/100/100;
		double degradation = valueOfTheProducts * factorOfDegradation;
		return degradation;
	}

	private double calculateCostOfVan() {
		return this.theVan.getCostOfCharge() + (this.theVan.getPriceOilPerKm() * this.destinationCity.getDistanceInKm());
	}

	private double calculateValueOfTheProducts() {
		double valueOfTheProducts = 0;
		Map<Integer, Double> products = this.theVan.getProducts();
		Map<Integer, Double> prices = this.destinationCity.getProductsPrices();
		
		for (Map.Entry<Integer, Double> product : products.entrySet()) {
			double kg = product.getValue();
			double price = prices.get(product.getKey());
			valueOfTheProducts += kg * price;
		}
		
		return valueOfTheProducts;
	}
	
	public Van getTheVan() {
		return this.theVan;
	}

	public City getDestinationCity() {
		return this.destinationCity;
	}
}
