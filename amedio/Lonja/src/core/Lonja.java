package core;

public class Lonja {
	private static final int PRICEKM = 2;
	private static final int PRICEFURGO = 5;

	private static int[] totalDistance = new int[] { 800, 1100, 600 };
	private static int[][] pricesPlaces = new int[][] { { 500, 0, 450 },
			{ 450, 120, 0 }, { 600, 100, 500 } };

	private static String[] cities = new String[] { "MADRID", "BARCELONA",
			"LISBOA" };

	public static String KataLonja(int[] transportQuantity) {
		String result;

		int[] gasto = new int[] { PRICEFURGO, PRICEFURGO, PRICEFURGO };
		int[] benefit = new int[] { 0, 0, 0 };
		for (int i = 0; i < totalDistance.length; i++) {
			gasto[i] += totalDistance[i] * PRICEKM;
			for (int j = 0; j < pricesPlaces[i].length; j++) {
				benefit[i] += pricesPlaces[i][j] * transportQuantity[j];
			}
		}

		int maxBenefit = -1000000;
		int indexMaxBenefit = -1;
		for (int i = 0; i < cities.length; i++) {
			if (maxBenefit < (benefit[i] - gasto[i])) {
				indexMaxBenefit = i;
				maxBenefit = benefit[i] - gasto[i];
			}
		}
		
		if(indexMaxBenefit == -1)
			indexMaxBenefit = 0;

		return cities[indexMaxBenefit];
	}
}
