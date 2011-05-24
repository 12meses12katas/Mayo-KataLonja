import java.util.Map;


public class City {

	private double distanceInKm;
	private Map<Integer, Double> productPrices;
	
	public City(double distanceInKm, Map<Integer, Double> productPrices) {
		this.distanceInKm = distanceInKm;
		this.productPrices = productPrices;
	}

	public double getDistanceInKm() {
		return this.distanceInKm;
	}

	public Map<Integer, Double> getProductsPrices() {
		return this.productPrices;
	}
	
}
