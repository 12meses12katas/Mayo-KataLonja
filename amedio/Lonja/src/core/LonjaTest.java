package core;

import junit.framework.Assert;

import org.junit.Test;

public class LonjaTest {
	@Test
	public void TestKataLonja() {
		String expected = new String("LISBOA");
		int[] input = new int[]{50,100,50};
		String actual = Lonja.KataLonja(input);
		Assert.assertEquals(expected, actual);
		
		expected = new String("BARCELONA");
		input = new int[]{0,200,0};
		actual = Lonja.KataLonja(input);
		Assert.assertEquals(expected, actual);
	}
}
