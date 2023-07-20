--[[
--File: Clean_energy.lua

-- Objective: To ensure clean energy access for everyone

--Clean Energy for All

--Declaring Global Variables
local totalEnergyProduction = 0
local cleanEnergyProduction = 0

--Function to calculate total Energy Production
function calculateTotalEnergyProduction(energy_producers)
	totalEnergyProduction = 0
	for k, v in pairs(energy_producers) do
		totalEnergyProduction = totalEnergyProduction + v
	end
	return totalEnergyProduction
end

--Function to calculate Clean Energy Production
function calculateCleanEnergyProduction(clean_energy_producers)
	cleanEnergyProduction = 0
	for k, v in pairs(clean_energy_producers) do
		cleanEnergyProduction = cleanEnergyProduction + v
	end
	return cleanEnergyProduction
end

--Function to calculate the percentage of Clean Energy
function calculateCleanEnergyPercentage(total_energy, clean_energy)
	local clean_energy_percentage = (clean_energy/total_energy) * 100
	return clean_energy_percentage
end

--Function to set up a plan for Clean Energy
function setCleanEnergyPlan(target, energy_production, clean_energy_production)
	while clean_energy_production < target do
		--Increase Clean Energy Production
		clean_energy_production = clean_energy_production + 1
		--Decrease Energy Production
		energy_production = energy_production - 1
	end
	return energy_production, clean_energy_production
end

--Function to Print Clean Energy Data
function printCleanEnergyData(total_energy, clean_energy, percentage)
	print("Total Energy Production = "..total_energy.." units")
	print("Clean Energy Production = "..clean_energy.." units")
	print("Percentage of Clean Energy = "..percentage.."%")
end

--Main Program Starts Here
--Declaring Variables
local energy_producers = {10, 20, 30, 40, 50}
local clean_energy_producers = {5, 10, 15, 20, 25}
local target = 35

--Calculating Total and Clean Energy Production
local total_energy = calculateTotalEnergyProduction(energy_producers)
local clean_energy = calculateCleanEnergyProduction(clean_energy_producers)

--Calculating Clean Energy Percentage
local clean_energy_percentage = calculateCleanEnergyPercentage(total_energy, clean_energy)

--Setting up a plan for Clean Energy
local energy_production, clean_energy_production = setCleanEnergyPlan(target, total_energy, clean_energy)

--Printing Clean Energy Data
printCleanEnergyData(energy_production, clean_energy_production, clean_energy_percentage)

--Main Program Ends Here
--]]