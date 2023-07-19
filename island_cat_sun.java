// File name: CleanEnergy.java

import java.util.ArrayList;

public class CleanEnergy {

// Class variables
	public static int numSolarPanels = 0;
	public static int numWindTurbines = 0;
	
// Utility methods
	public static void increaseSolarPanels() {
		numSolarPanels += 1;
	}
	
	public static void increaseWindTurbines() {
		numWindTurbines += 1;
	}
	
// Main method
	public static void main(String[] args) {
		
// Initialize ArrayLists
		ArrayList<String> solarPanelManufacturers = new ArrayList<String>();
		ArrayList<String> windTurbineManufacturers = new ArrayList<String>();
		
// Populate ArrayLists with data
		solarPanelManufacturers.add("SolarCity");
		solarPanelManufacturers.add("SunPower");
		solarPanelManufacturers.add("SunEdison");
		
		windTurbineManufacturers.add("GE");
		windTurbineManufacturers.add("Vestas");
		windTurbineManufacturers.add("Acciona");
		
// Create for-each loops to iterate through ArrayLists
		for (String manufacturer : solarPanelManufacturers) {
			increaseSolarPanels();
		}
		
		for (String manufacturer : windTurbineManufacturers) {
			increaseWindTurbines();
		}
		
// Print out how many solar panels and wind turbines
		System.out.println("We have " + numSolarPanels + " solar panels and " + numWindTurbines + " wind turbines.");
		
// Call methods to get cost estimates
		double solarPanelCost = getSolarPanelCost();
		double windTurbineCost = getWindTurbineCost();
		
// Print out cost estimates
		System.out.println("The estimated cost to install " + numSolarPanels + " solar panels is $" + solarPanelCost + ".");
		System.out.println("The estimated cost to install " + numWindTurbines + " wind turbines is $" + windTurbineCost + ".");
		
	}
	
// Method to get estimated cost of solar panels
	public static double getSolarPanelCost() {
		return numSolarPanels * 200;
	}
	
// Method to get estimated cost of wind turbines
	public static double getWindTurbineCost() {
		return numWindTurbines * 5000;
	}
	
}