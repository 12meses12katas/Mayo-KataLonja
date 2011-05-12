import static org.junit.Assert.*;
import groovy.util.GroovyTestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Test 


class FishMarketTest extends GroovyTestCase {
    
    private market; 
    
    @Before
    public void setUp() throws Exception {
        market = new FishMarket()
    }
    
    @After
    public void tearDown() throws Exception {
    }
    
    @Test
    public void testLisbon(){
        def city = market.bestSelling(50, 100, 50)
        assertEquals "Lisbon", city.name
    }
    
    @Test
    public void testBarcelona(){
        def city = market.bestSelling(0, 200, 0)
        assertEquals "Barcelona", city.name
    }
}
