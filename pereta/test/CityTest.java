
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

public class CityTest {
	
	private double distanceInKm = 100;
	private Map<Integer, Double> productPrices;
	private City aCity;
	
	@Before
	public void setUp() throws Exception {		
		this.productPrices = new HashMap<Integer, Double>();
		this.aCity = new City(this.distanceInKm, this.productPrices);
	}
	
	@Test
	public void aCityHasTheDistanceFromOrigin() throws Exception {
		double distanceActualInKm = aCity.getDistanceInKm();
		assertEquals(this.distanceInKm, distanceActualInKm, 0);
	}
	
	@Test
	public void aCityHasThePricesForTheMerchandise() throws Exception {
		assertNotNull(this.aCity.getProductsPrices());
	}
}
