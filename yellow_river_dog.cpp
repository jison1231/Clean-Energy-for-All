#include <iostream> 

using namespace std;

//Global variables
float solarEmissionReductionPerKW = 0.3; //in tonnes per month 
float solarCostReductionPerKW = 0.6; //in $ per month
float windEmissionReductionPerKW = 0.2; //in tonnes per month
float windCostReductionPerKW = 0.5; //in $ per month

//Creating a class for clean energy sources
class CleanEnergySource {
    public:
    string sourceName;
    int energyGeneratedPerKW;

    CleanEnergySource(string sourceName, int energyGeneratedPerKW){
        this->sourceName = sourceName;
        this->energyGeneratedPerKW = energyGeneratedPerKW;
    }

    //Function to calculate the emission reduction
    float CalculateEmissionReductionPerKW(){
        if(sourceName == "Solar"){
            return energyGeneratedPerKW * solarEmissionReductionPerKW;
        } else if (sourceName == "Wind"){
            return energyGeneratedPerKW * windEmissionReductionPerKW;
        } 
    }

    //Function to calculate the cost reduction
    float CalculateCostReductionPerKW(){
        if(sourceName == "Solar"){
            return energyGeneratedPerKW * solarCostReductionPerKW;
        } else if (sourceName == "Wind"){
            return energyGeneratedPerKW * windCostReductionPerKW;
        } 
    }
};

//Function to calculate the total emission reduction
float CalculateTotalEmissionReduction(CleanEnergySource cleanEnergies[], int numCleanEnergies){
    float totalEmissionReduction = 0;
    for(int i=0; i<numCleanEnergies; i++){
        totalEmissionReduction += cleanEnergies[i].CalculateEmissionReductionPerKW();
    }
    return totalEmissionReduction;
}

//Function to calculate the total cost reduction
float CalculateTotalCostReduction(CleanEnergySource cleanEnergies[], int numCleanEnergies){
    float totalCostReduction = 0;
    for(int i=0; i<numCleanEnergies; i++){
        totalCostReduction += cleanEnergies[i].CalculateCostReductionPerKW();
    }
    return totalCostReduction;
}

int main(){
    CleanEnergySource cleanEnergies[] = { CleanEnergySource("Solar", 10), CleanEnergySource("Wind", 20) };
    int numCleanEnergies = sizeof(cleanEnergies) / sizeof(CleanEnergySource);

    cout << "Total Emission Reduction (in tonnes per month) = " << CalculateTotalEmissionReduction(cleanEnergies, numCleanEnergies) << endl; 
    cout << "Total Cost Reduction (in $ per month) = " << CalculateTotalCostReduction(cleanEnergies, numCleanEnergies) << endl;
    return 0; 
}