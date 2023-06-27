package com.cleanEnergyForAll

import scala.io.Source

object CleanEnergyForAll {

// Reads the energy dataset from a CSV file
def readEnergyData(filename: String): List[String] = {
    val bufferedSource = Source.fromFile(filename)
    val lines = (for (line <- bufferedSource.getLines) yield line).toList
    bufferedSource.close
    lines
  }

// Calculates the total energy consumption from the energy dataset
def calculateTotalConsumption(energyData: List[String]): Double = {
    var totalConsumption = 0.0
    for (energyEntry <- energyData) {
      val energyParts = energyEntry.split(",")
      val energyConsumption = energyParts(1).toDouble
      totalConsumption += energyConsumption
    }
    totalConsumption
  }

// Calculates the clean energy usage from the energy dataset
def calculateCleanEnergyUsage(energyData: List[String]): Double = {
    var cleanEnergyUsage = 0.0
    for (energyEntry <- energyData) {
      val energyParts = energyEntry.split(",")
      val energySource = energyParts(0)
      val energyConsumption = energyParts(1).toDouble
      if (isCleanEnergySource(energySource)) {
        cleanEnergyUsage += energyConsumption
      }
    }
    cleanEnergyUsage
  }

// Checks if the energy source is a clean energy source
def isCleanEnergySource(energySource: String): Boolean = {
    val cleanEnergySources = List("solar", "wind", "hydro")
    cleanEnergySources.contains(energySource)
  }

// Calculates the clean energy percentage from the total consumption
def calculateCleanEnergyPercentage(totalConsumption: Double, cleanEnergyUsage: Double): Double = {
    cleanEnergyUsage / totalConsumption * 100
  }

// Prints the clean energy percentage
def printCleanEnergyPercentage(cleanEnergyPercentage: Double): Unit = {
    println(f"Clean energy is providing $cleanEnergyPercentage%.2f%% of total energy consumption.")
  }

// Main function to run the program
def main(args: Array[String]): Unit = {
    val energyDataFilename = args(0)
    val energyData = readEnergyData(energyDataFilename)
    val totalConsumption = calculateTotalConsumption(energyData)
    val cleanEnergyUsage = calculateCleanEnergyUsage(energyData)
    val cleanEnergyPercentage = calculateCleanEnergyPercentage(totalConsumption, cleanEnergyUsage)
    printCleanEnergyPercentage(cleanEnergyPercentage)
  }

}