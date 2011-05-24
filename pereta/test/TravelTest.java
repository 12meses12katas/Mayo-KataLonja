
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class TravelTest {

	private final static int VIEIRAS = 1;
	private final static int PULPO = 2;
	private final static int CENTOLLOS = 3;
	private final static double DISTANCE_TO_MADRID = 800;
	private final static double DISTANCE_TO_BARCELONA = 1100;
	private final static double DISTANCE_TO_LISBOA = 600;
	private final static double MAXIMUM_LOAD = 200;
	private final static double PRICE_OIL_PER_KM = 2;
	private final static double COST_OF_CHARGE = 5;
	
	private City madrid;
	private City barcelona;
	private City lisboa;
	private Van theVan;
	private Travel travelToMadrid;
	private Travel travelToBarcelona;
	private Travel travelToLisboa;
	private static Map<Integer, Double> productPricesToMadrid;
	private static Map<Integer, Double> productPricesToBarcelona;
	private static Map<Integer, Double> productPricesToLisboa;
	private static Map<Integer, Double> merchandiseOfTheVan;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		productPricesToMadrid = productPricesToMadrid();
		productPricesToBarcelona = productPricesToBarcelona();
		productPricesToLisboa = productPricesToLisboa();
		merchandiseOfTheVan = merchandiseOfTheVan();
	}

	@Before
	public void setUp() throws Exception {
		this.madrid = new City(DISTANCE_TO_MADRID, productPricesToMadrid);
		this.barcelona = new City(DISTANCE_TO_BARCELONA, productPricesToBarcelona);
		this.lisboa = new City(DISTANCE_TO_LISBOA, productPricesToLisboa);
		this.theVan = new Van(MAXIMUM_LOAD, PRICE_OIL_PER_KM, COST_OF_CHARGE, merchandiseOfTheVan);
		this.travelToMadrid = new Travel(this.theVan, this.madrid);
		this.travelToBarcelona = new Travel(this.theVan, this.barcelona);
		this.travelToLisboa = new Travel(this.theVan, this.lisboa);
	}
	
	@Test
	public void aTravelHasAVan() throws Exception {
		assertNotNull(this.travelToMadrid.getTheVan());
	}
	
	@Test
	public void aTravelHasADestinationCity() throws Exception {
		assertNotNull(this.travelToMadrid.getDestinationCity());
	}
	
	@Test
	public void aTravelToMadridHasAProfit() throws Exception {
		double valueProductsToMadrid = (50*500)+(100*0)+(50*450);
		double costOfVanToMadrid = COST_OF_CHARGE + (PRICE_OIL_PER_KM*DISTANCE_TO_MADRID);
		double degradateOfProductsToMadrid = valueProductsToMadrid * 0.08;
		double profitExpected = valueProductsToMadrid - costOfVanToMadrid - degradateOfProductsToMadrid;
		
		double profitActual = this.travelToMadrid.calculateProfit();
		
		System.out.println("Madrid -> "+profitActual);
		assertEquals(profitExpected, profitActual, 0);
	}
	
	@Test
	public void aTravelToBarcelonaHasAProfit() throws Exception {
		double valueProductsToBarcelona = (50*450)+(100*120)+(50*0);
		double costOfVanToBarcelona = COST_OF_CHARGE + (PRICE_OIL_PER_KM*DISTANCE_TO_BARCELONA);
		double degradateOfProductsToBarcelona = valueProductsToBarcelona * 0.11;
		double profitExpected = valueProductsToBarcelona - costOfVanToBarcelona - degradateOfProductsToBarcelona;
		
		double profitActual = this.travelToBarcelona.calculateProfit();
		
		System.out.println("Barcelona -> "+profitActual);
		assertEquals(profitExpected, profitActual, 0);
	}
	
	@Test
	public void aTravelToLisboaHasAProfit() throws Exception {
		double valueProductsToLisboa = (50*600)+(100*100)+(50*500);
		double costOfVanToLisboa = COST_OF_CHARGE + (PRICE_OIL_PER_KM*DISTANCE_TO_LISBOA);
		double degradateOfProductsToLisboa = valueProductsToLisboa * 0.06;
		double profitExpected = valueProductsToLisboa - costOfVanToLisboa - degradateOfProductsToLisboa;
		
		double profitActual = this.travelToLisboa.calculateProfit();
		
		System.out.println("Lisboa -> "+profitActual);
		assertEquals(profitExpected, profitActual, 0);
	}
	
	@Test (expected=Exception.class)
	public void aTravelWithAOverloadVanThrowsException() throws Exception {
		Map<Integer, Double> moreProductsThanTheMax = new HashMap<Integer, Double>();
		moreProductsThanTheMax.put(VIEIRAS, 50.0);
		moreProductsThanTheMax.put(PULPO, 100.0);
		moreProductsThanTheMax.put(CENTOLLOS, 51.0);
		Van overloadVan = new Van(MAXIMUM_LOAD, PRICE_OIL_PER_KM, COST_OF_CHARGE, moreProductsThanTheMax);
		Travel overloadTravel = new Travel(overloadVan, this.madrid);
		
		overloadTravel.calculateProfit();
	}
	
	private static Map<Integer, Double> productPricesToMadrid() {
		Map<Integer, Double> productPrices = new HashMap<Integer, Double>();
		productPrices.put(VIEIRAS, 500.0);
		productPrices.put(PULPO, 0.0);
		productPrices.put(CENTOLLOS, 450.0);
		
		return productPrices;
	}
	
	private static Map<Integer, Double> productPricesToBarcelona() {
		Map<Integer, Double> productPrices = new HashMap<Integer, Double>();
		productPrices.put(VIEIRAS, 450.0);
		productPrices.put(PULPO, 120.0);
		productPrices.put(CENTOLLOS, 0.0);
		
		return productPrices;
	}
	
	private static Map<Integer, Double> productPricesToLisboa() {
		Map<Integer, Double> productPrices = new HashMap<Integer, Double>();
		productPrices.put(VIEIRAS, 600.0);
		productPrices.put(PULPO, 100.0);
		productPrices.put(CENTOLLOS, 500.0);
		
		return productPrices;
	}

	private static Map<Integer, Double> merchandiseOfTheVan() {
		Map<Integer, Double> products = new HashMap<Integer, Double>();
		products.put(VIEIRAS, 50.0);
		products.put(PULPO, 100.0);
		products.put(CENTOLLOS, 50.0);
		
		return products;
	}
}
