package com.example.lonja;

import java.util.Hashtable;

public class Katalonja
{
	private static final int KM_TAX = 2;
	private static final int PICK_TAX = 5;

	// Seafood enum order
	private static final int[] SEAFOOD_TRANSPORTED = new int[]
	{ 50, 100, 50 };
	
	// City enum order
	private static final int[] CITY_DISTANCES = new int[]
	{ 800, 1100, 600 };
	
	// City and Seafood enums order
	private static final int[][] CITY_PRICES = new int[][]
	{
	{ 500, 0, 450 },
	{ 450, 120, 0 },
	{ 600, 100, 500 } };

	private static Hashtable<City, Integer> getCitiesDistances()
	{
		Hashtable<City, Integer> citiesDistances = new Hashtable<City, Integer>();

		for (City city : City.values())
			citiesDistances.put(city, Katalonja.CITY_DISTANCES[city.ordinal()]);

		return citiesDistances;
	}

	private static Hashtable<Seafood, Integer> getSeafoodTransported()
	{
		Hashtable<Seafood, Integer> mariscTransported = new Hashtable<Seafood, Integer>();

		for (Seafood seafood : Seafood.values())
			mariscTransported.put(seafood, Katalonja.SEAFOOD_TRANSPORTED[seafood.ordinal()]);

		return mariscTransported;
	}

	private static Hashtable<City, Hashtable<Seafood, Integer>> getCitiesPrices()
	{
		Hashtable<City, Hashtable<Seafood, Integer>> citiesPrices = new Hashtable<City, Hashtable<Seafood, Integer>>();
		for (City city : City.values())
		{
			Hashtable<Seafood, Integer> cityPrices = new Hashtable<Seafood, Integer>();
			for (Seafood seafood : Seafood.values())
				cityPrices.put(seafood, Katalonja.CITY_PRICES[city.ordinal()][seafood.ordinal()]);
			citiesPrices.put(city, cityPrices);
		}

		return citiesPrices;
	}

	public static int getTransportCostTo(City city)
	{
		Hashtable<City, Integer> citiesDistances = getCitiesDistances();

		return PICK_TAX + citiesDistances.get(city) * KM_TAX;
	}

	public static int getSendProfitsFrom(City city)
	{
		int sendPrice = 0;
		Hashtable<City, Hashtable<Seafood, Integer>> citiesPrices = getCitiesPrices();
		Hashtable<Seafood, Integer> cityPrices = citiesPrices.get(city);
		Hashtable<Seafood, Integer> seafoodTransported = getSeafoodTransported();

		for (Seafood seafood : cityPrices.keySet())
			sendPrice += cityPrices.get(seafood) * seafoodTransported.get(seafood);

		return sendPrice - getDepreciationTransportTo(sendPrice, city);
	}

	private static int getDepreciationTransportTo(int sendPrice, City city)
	{
		Hashtable<City, Integer> citiesDistances = getCitiesDistances();

		return sendPrice * citiesDistances.get(city) / 10000;
	}

	public static City getOptimalCityToSend()
	{
		int optimalNetProfits = Integer.MIN_VALUE;
		City optimalCity = null;

		for (City city : City.values())
		{
			int cityNetProfits = getSendProfitsFrom(city) - getTransportCostTo(city);
			if (cityNetProfits > optimalNetProfits)
			{
				optimalNetProfits = cityNetProfits;
				optimalCity = city;
			}
		}

		return optimalCity;
	}
}
