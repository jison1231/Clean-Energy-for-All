import scala.util.{Success, Try}

object CleanEnergy {
  def main(args: Array[String]): Unit = {
	
    // define constants for clean energy
    val solarEnergy = "Solar Energy"
    val windEnergy = "Wind Energy"
    val geothermalEnergy = "Geothermal Energy"
    val hydroelectricity = "Hydroelectricity"
    
    // create a list of clean energy sources
    val cleanEnergyList = List(solarEnergy, windEnergy, geothermalEnergy, hydroelectricity)
	
    // define a function to check if a user-inputted  energy resource is clean
    def isCleanEnergy(resourceName : String): Boolean = 
	  Try(resourceName.toLowerCase() match {
	    case solarEnergy.toLowerCase() => true
	    case windEnergy.toLowerCase() => true
	    case geothermalEnergy.toLowerCase() => true
	    case hydroelectricity.toLowerCase() => true
	  }) match {
      case Success(b) => b
      case _ => false
    }

    // define a function to check user energy consumption levels
    def checkEnergyConsumptionLevel(energyConsumption : Double): String = {
	  if (energyConsumption >= 1.0) 
	    "You are consuming too much energy. Please switch to a clean source!"
	  else
	    "Your energy consumption is well within acceptable levels."
    }

    // define a function to generate a clean energy consumption report
    def generateCleanEnergyReport(energyConsumption : Double) : String = {
      // calculate percentage of energy spent on clean energy
      val cleanEnergyPercentage = energyConsumption * 100
      // generate report
      val report = s"You are using $cleanEnergyPercentage% clean energy."
      report
    }
	
    // define a function to calculate the amount of clean energy generated 
    def calculateCleanEnergy(energyConsumption : Double, cleanSource : String): Double = {
	  // calculate clean energy generated
	  val cleanEnergyGenerated = energyConsumption * cleanSource.length
	  cleanEnergyGenerated
    }
	
    // define a function to compare clean energy sources
    def compareCleanEnergySources(source1 : String, source2 : String): String = {
	  // check if both sources are clean
	  if (isCleanEnergy(source1) && isCleanEnergy(source2)) {
	    // compare clean energy sources
	    if (source1 == solarEnergy && source2 == windEnergy)
	      solarEnergy + " is more efficient than " + windEnergy
	    else if (source1 == windEnergy && source2 == solarEnergy) 
	      windEnergy + " is more efficient than " + solarEnergy
	    else if (source1 == geothermalEnergy && source2 == hydroelectricity)
	      geothermalEnergy + " is more efficient than " + hydroelectricity
	    else if (source1 == hydroelectricity && source2 == geothermalEnergy)
	      hydroelectricity + " is more efficient than " + geothermalEnergy
	    else 
	      "Both sources have the same efficiency."
	  } else {
	    "One or both sources are not clean."
	  }
    }

    // define a function to find the most economical clean energy source
    def findMostEconomicalCleanSource(cleanEnergySources : List[String]) : String = {
	  // sort list of clean energy sources in descending order
	  val sortedCleanEnergySources = cleanEnergySources.sortWith(_ > _)
	
	  // return the most economical clean energy source
	  sortedCleanEnergySources.head
    }
	
    // define a function to determine if a clean energy source is cost effective
    def isCleanEnergySourceCostEffective(cleanSource : String, energyConsumption : Double): Boolean = {
	  // calculate cost
	  val cost = calculateCleanEnergy(energyConsumption, cleanSource)
	
	  // check if cost is below certain threshold
	  if (cost <= 10.0) 
	    true
	  else
	    false
    }
 
    // define a function to calculate the total cost of a clean energy source
    def calculateCostOfCleanSource(cleanSource : String, energyConsumption : Double) : Double = {
	  // calculate clean energy generated
	  val cleanEnergyGenerated = calculateCleanEnergy(energyConsumption, cleanSource)
	  // calculate total cost
	  val totalCost = cleanEnergyGenerated * 0.15
	  totalCost 
    }

    // define a function to determine if a clean energy source will last for a certain number of years
    def doesCleanSourceLast(cleanSource : String, energyConsumption : Double, years : Int): Boolean = {
	  // calculate total cost of clean energy source
	  val totalCost = calculateCostOfCleanSource(cleanSource, energyConsumption)
	  // calculate cost per year
	  val costPerYear = totalCost/years
	  // check if cost per year is below certain threshold
	  if (costPerYear <= 5.0)
	    true
	  else
	    false
    }

}