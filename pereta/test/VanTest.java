import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

public class VanTest {
	
	private double maximumLoadInKg = 200;
	private double priceOilPerKm = 2;
	private double costOfCharge = 5;
	private Map<Integer, Double> Products;
	private Van aVan;
	
	@Before
	public void setUp() throws Exception {
		this.Products = new HashMap<Integer, Double>();
		this.aVan = new Van(this.maximumLoadInKg, this.priceOilPerKm, this.costOfCharge, this.Products);
	}
	
	@Test
	public void aVanHasAMaximumLoad() throws Exception {
		double maximumLoadInKgActual = this.aVan.getMaximumLoadInKg();
		assertEquals(this.maximumLoadInKg, maximumLoadInKgActual, 0);
	}
	
	@Test
	public void aVanHasAPriceOilPerKm() throws Exception {
		double priceOilPerKmActual = this.aVan.getPriceOilPerKm();
		assertEquals(this.priceOilPerKm, priceOilPerKmActual, 0);
	}
	
	@Test
	public void aVanHasACostOfCharge() throws Exception {
		double costOfChargeActual = this.aVan.getCostOfCharge();
		assertEquals(this.costOfCharge, costOfChargeActual, 0);
	}
	
	@Test
	public void aVanHasTheMerchandise() throws Exception {
		assertNotNull(this.aVan.getProducts());
	}
}
