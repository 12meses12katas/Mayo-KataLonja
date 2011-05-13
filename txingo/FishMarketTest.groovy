import static org.junit.Assert.*;
import groovy.util.GroovyTestCase;

import org.junit.Before;
import org.junit.Test 


class FishMarketTest extends GroovyTestCase {
    
    private market; 
    
    @Before
    public void setUp() throws Exception {
        market = new FishMarket()
    }
    
    @Test
    public void testLisbon(){
        def city = market.bestSelling(["scallop":50, "octopus":100, "spidercrab":50])
        assertEquals "Lisboa", city
    }
    
    @Test
    public void testBarcelona(){
        def city = market.bestSelling(["scallop":0, "octopus":200, "spidercrab":0])
        assertEquals "Barcelona", city
    }
}
