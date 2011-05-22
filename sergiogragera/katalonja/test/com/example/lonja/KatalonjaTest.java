package com.example.lonja;

import static org.junit.Assert.*;

import org.junit.Test;

public class KatalonjaTest
{
	@Test
	public void transportCost() throws Exception
	{
		assertEquals(1205, Katalonja.getTransportCostTo(City.LISBOA));
		assertEquals(1605, Katalonja.getTransportCostTo(City.MADRID));
	}
	
	@Test
	public void sendProfits() throws Exception
	{
		assertEquals(61100, Katalonja.getSendProfitsFrom(City.LISBOA));
		assertEquals(43700, Katalonja.getSendProfitsFrom(City.MADRID));		
	}
	
	@Test
	public void optimalCityToSend() throws Exception
	{
		assertEquals(City.LISBOA, Katalonja.getOptimalCityToSend());		
	}
}
