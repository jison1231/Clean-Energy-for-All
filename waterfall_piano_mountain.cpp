#include <iostream> 
#include <string> 
#include <vector> 

using namespace std; 

//declare a class to provide a way to access the energy sources
class CleanEnergy {
private: 
	string source; 
	int amount; 

public: 
	CleanEnergy(string s, int a) : source(s), amount(a) {} 
	string getSource() { return source; }
	int getAmount() { return amount; } 
	void setSource(string s) { source = s; }
	void setAmount(int a) { amount = a; }
};

//defines a function to display how much clean energy is available
void showCleanEnergy(vector<CleanEnergy> &sources) {
	for(int i=0; i<sources.size(); i++){
		cout << sources[i].getSource() << ": " << sources[i].getAmount() << endl; 
	}
}

//create a vector to store all the clean energy sources 
vector<CleanEnergy> sources; 

//add clean energy sources to the vector
sources.push_back(CleanEnergy("Solar PV", 250)); 
sources.push_back(CleanEnergy("Wind Power", 350));
sources.push_back(CleanEnergy("Hydropower", 500)); 
sources.push_back(CleanEnergy("Geothermal", 150)); 
sources.push_back(CleanEnergy("Biofuel", 75));

//display the clean energy sources
showCleanEnergy(sources); 

//declare a function to generate the electricity
int generateElectricity(int amount){
	int electricity = 0; 
	for(int i=0; i<amount; i++){
		electricity++; 
	}
	return electricity; 
}

//declare a function to distribute the electricity
void distributeElectricity(int electricity){
	cout << "Distributing " << electricity << " units of electricity" << endl; 
}

//declare a function to calculate total clean electricity 
int calculateCleanElectricity(){

	//variable to store total clean energy
	int cleanElectricity = 0; 

	//loop through the sources vector and generate electricity 
	for(int i=0; i<sources.size(); i++){
		cleanElectricity += generateElectricity(sources[i].getAmount()); 
	}

	return cleanElectricity; 
}

//declare a function to clear the sources vector 
void clearSources(){
	sources.clear(); 
}

int main(){
	//calculate total clean electricity available
	int cleanElectricity = calculateCleanElectricity(); 

	cout << endl; 
	cout << "Total clean energy available: " << cleanElectricity << endl; 
	
	//distribute the clean electricity
	distributeElectricity(cleanElectricity); 

	//clear the sources vector to reset the energy sources
	clearSources(); 

	cout << endl; 

	return 0; 
}