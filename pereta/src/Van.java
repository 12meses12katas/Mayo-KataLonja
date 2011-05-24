import java.util.Map;


public class Van {

	private double maximumLoadInKg;
	private double priceOilPerKm;
	private double costOfCharge;
	private Map<Integer, Double> products;
	
	public Van(double maximumLoadInKg, double priceOilPerKm, double costOfCharge, Map<Integer, Double> products) {
		this.maximumLoadInKg = maximumLoadInKg;
		this.priceOilPerKm = priceOilPerKm;
		this.costOfCharge = costOfCharge;
		this.products = products;
	}

	public double getMaximumLoadInKg() {
		return this.maximumLoadInKg;
	}

	public double getPriceOilPerKm() {
		return this.priceOilPerKm;
	}

	public double getCostOfCharge() {
		return this.costOfCharge;
	}

	public Map<Integer, Double> getProducts() {
		return this.products;
	}

}
