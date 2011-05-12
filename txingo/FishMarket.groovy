
class FishMarket {
    private static LOAD_COST = 5
    private static TRAVEL_COST_KM_RATE = 2
    
    public bestSelling(def scallopLoad, def octopusLoad, def spidercrabLoad ) {
        def madrid = new City(distanceFromOrigin:800, scallopPrice:500, octopusPrice:0, spidercrabPrice:450, name:"Madrid")
        def barcelona = new City(distanceFromOrigin:1100, scallopPrice:450, octopusPrice:120, spidercrabPrice:0, name:"Barcelona")
        def lisbon = new City(distanceFromOrigin:600, scallopPrice:600, octopusPrice:100, spidercrabPrice:500, name:"Lisbon")
        
        def cities = [madrid , barcelona , lisbon]
        def seller = new FisherMan(scallopLoad:scallopLoad, octopusLoad:octopusLoad, spidercrabLoad:spidercrabLoad)
        
        def totalCost = cities.collect { LOAD_COST + TRAVEL_COST_KM_RATE * it.distanceFromOrigin }
        def income = cities.collect {
            def scallopIncome = it.scallopPrice * seller.scallopLoad
            def octopusIncome = it.octopusPrice * seller.octopusLoad
            def spidercrabIncome = it.spidercrabPrice * seller.spidercrabLoad
            def total = scallopIncome + octopusIncome + spidercrabIncome
            total - (total * 0.01 * it.distanceFromOrigin / 100)
        }
        
        cities.eachWithIndex { it, i ->
            it.income = income[i] - totalCost[i]
        }
        
        cities.max { it.income }
    }
}
