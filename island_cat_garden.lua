--[[
This program demonstrates how clean energy can be used to power a home or business.

--]]

-- Initialize the variables used in this program
local electricityGenerated = 0
local energyFromTheSun = 0
local energyFromWind = 0
local energyFromWater = 0

-- Calculate the current energy generated from available sources
energyFromTheSun = calculateSolarEnergyGenerated()
energyFromWind = calculateWindEnergyGenerated()
energyFromWater = calculateHydroEnergyGenerated()

-- Add all energy sources together to get total energy generated
electricityGenerated = energyFromTheSun + energyFromWind + energyFromWater

-- Output the total amount of energy generated
print("Total energy generated: "..electricityGenerated)

-- Use the generated energy to power appliances in the home or business
useCleanEnergyToPowerAppliances(electricityGenerated)

-- Calculate how much energy is being saved by using clean energy
local energySaved = calculateEnergySavedFromCleanEnergy()

-- Output the amount of energy saved
print("Energy Saved: "..energySaved)

-- Calculate the impact of the clean energy used
local environmentalImpact = calculateEnvironmentalImpactOfCleanEnergyUsage()

-- Output the environmental impact of using clean energy
print("Environmental Impact: "..environmentalImpact)

-- Calculate the financial benefits of using clean energy
local financialBenefits = calculateFinancialBenefitsFromCleanEnergyUsage()

-- Output the financial benefits of using clean energy
print("Financial Benefits: "..financialBenefits)

-- Calculate the long-term savings of using clean energy
local longTermSavings = calculateLongTermSavingsFromCleanEnergyUsage()

-- Output the long-term savings of using clean energy
print("Long-term Savings: "..longTermSavings)

-- Calculate the level of job security provided by clean energy
local jobSecurityLevel = calculateJobSecurityLevelFromCleanEnergyUsage()

-- Output the level of job security provided by clean energy
print("Job Security Level: "..jobSecurityLevel)

-- Calculate the health benefits of using clean energy
local healthBenefits = calculateHealthBenefitsFromCleanEnergyUsage()

-- Output the health benefits of using clean energy
print("Health Benefits: "..healthBenefits)

-- Calculate the rate at which clean energy is being adopted
local adoptionRate = calculateAdoptionRate()

-- Output the adoption rate of clean energy
print("Adoption Rate: " .. adoptionRate)

-- Calculate the amount of investment needed to increase the adoption rate
local investmentRequired = calculateInvestmentRequiredForIncreasedAdoption()

-- Output the amount of investment needed to increase the adoption rate
print("Investment Required: "..investmentRequired)

-- Calculate the amount of emissions reduced by using clean energy
local emissionsReduced = calculateEissionReducedFromCleanEnergyUsage()

-- Output the amount of emissions reduced by using clean energy
print("Emissions Reduced: "..emissionsReduced)

-- Calculate the amount of money saved from the use of clean energy
local moneySaved = calculateMoneySavedFromCleanEnergyUsage()

-- Output the amount of money saved from the use of clean energy
print("Money Saved: "..moneySaved)