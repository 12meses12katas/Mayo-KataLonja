
class FishMarket {
    def static LOAD_COST = 5
    def static TRAVEL_COST_KM_RATE = 2
    def static EVERY_100_KM_1_PERCENT_LESS = 1 / 100 / 100 // 1% / 100 km
    
    def cities = [
        "Madrid",
        "Barcelona",
        "Lisboa"
    ]
    def completeMap = [:]
    
    public FishMarket(){
        initCompleteMap()
    }
    
    private initCompleteMap(){
        completeMap["Madrid"] = [
            ["prices": ["scallop":500, "octopus":0 , "spidercrab":450]],
            ["distance": 800]
        ]
        completeMap["Barcelona"] = [
            ["prices": ["scallop":450, "octopus":120 , "spidercrab":0]],
            ["distance": 1100]
        ]
        completeMap["Lisboa"] = [
            ["prices": ["scallop":600, "octopus":100 , "spidercrab":500]],
            ["distance": 600]
        ]
    }
    
    public bestSelling(def loads){
        def profits = [:]
        cities.each { city ->
            calculateProfitsInCity(profits, loads, city)
        }
        def maxProfit = profits.keySet().max()
        profits[maxProfit]
    }
    
    private calculateProfitsInCity(def profits, def loads, def city){
        def profit = calculateIncome(loads, city) - calculateCost(city)
        profits[profit] = city
    }
    
    private calculateIncome(def loads, def city){
        def cityMap = completeMap[city]
        def scallop = cityMap.prices.scallop.get(0) * loads.scallop
        def octopus = cityMap.prices.octopus.get(0) * loads.octopus
        def spidercrab = cityMap.prices.spidercrab.get(0) * loads.spidercrab
        def income = scallop + octopus + spidercrab
        def distance = cityMap.distance.get(1)
        income * EVERY_100_KM_1_PERCENT_LESS * distance
    }
    
    private calculateCost(def city){
        def cityMap = completeMap[city]
        def distance = cityMap.distance.get(1)
        def kmCost = distance * TRAVEL_COST_KM_RATE
        LOAD_COST + kmCost
    }
}
