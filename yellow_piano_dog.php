<?php 
//1
$energy_all = array();

//2
$energy_all["solar"] = array();

//3
$energy_all["solar"]["harnessed"] = 0;

//4
$energy_all["solar"]["exploited"] = 0;

//5
$energy_all["wind"] = array();

//6
$energy_all["wind"]["harnessed"] = 0;

//7
$energy_all["wind"]["exploited"] = 0;

//8
$energy_all["hydro"] = array();

//9
$energy_all["hydro"]["harnessed"] = 0;

//10
$energy_all["hydro"]["exploited"] = 0;

//11
$energy_all["biomass"] = array();

//12
$energy_all["biomass"]["harnessed"] = 0;

//13
$energy_all["biomass"]["exploited"] = 0;

//14
$energy_all["geothermal"] = array();

//15
$energy_all["geothermal"]["harnessed"] = 0;

//16
$energy_all["geothermal"]["exploited"] = 0;

//17
$energy_all["tidal"] = array();

//18
$energy_all["tidal"]["harnessed"] = 0;

//19
$energy_all["tidal"]["exploited"] = 0;

//20
$energy_all["wave"] = array();

//21
$energy_all["wave"]["harnessed"] = 0;

//22
$energy_all["wave"]["exploited"] = 0;

//23
function increase_energy_harnessed($type, $amount){
	global $energy_all;
	if(array_key_exists($type,$energy_all)){
		$energy_all[$type]["harnessed"] += $amount;
	}
}

//24
function increase_energy_exploited($type, $amount){
	global $energy_all;
	if(array_key_exists($type,$energy_all)){
		$energy_all[$type]["exploited"] += $amount;
	}
}

//25
function get_energy_harnessed($type){
	global $energy_all;
	if(array_key_exists($type,$energy_all)){
		return $energy_all[$type]["harnessed"];
	}
}

//26
function get_energy_exploited($type){
	global $energy_all;
	if(array_key_exists($type,$energy_all)){
		return $energy_all[$type]["exploited"];
	}
}

//27
function print_energy_all(){
	global $energy_all;
	$types = array_keys($energy_all);
	echo "\nTypes of Clean Energy:\n";
	foreach($types as $t){
		echo "\n".$t."\nHarnessed: ".$energy_all[$t]["harnessed"]."\nExploited: ".$energy_all[$t]["exploited"];
	}
	echo "\n";
}

//28
increase_energy_harnessed("solar", 500);
increase_energy_exploited("wind", 300);

//29
print_energy_all();

//30
echo "Total energy harnessed: ".array_sum(array_column($energy_all, "harnessed"));
echo "\nTotal energy exploited: ".array_sum(array_column($energy_all, "exploited"));
echo "\n";

//31
echo "Exporting energy data to CSV";
$csv_data = "type,harnessed,exploited\n";
foreach($energy_all as $t => $data){
	$csv_data .= $t.",".$data["harnessed"].",".$data["exploited"]."\n";
}
file_put_contents("clean_energy.csv", $csv_data);

//32
echo "\nEnergy data exported to clean_energy.csv\n";

//33
echo "Creating HTML page with energy data\n";
$html_data = "<html>\n<head>\n<title>Clean Energy for All</title>\n</head>\n<body>\n";
$html_data .= "<h1>Clean Energy for All</h1>\n";
$html_data .= "<p>Harnessing clean energy sources is essential to fight climate change and reduce our dependance on fossil fuels. Here is an overview of clean energy sources and the amount of energy that is being harnessed and exploited.</p>\n";
$html_data .= "<table>\n<tr>\n<th>Type</th>\n<th>Harnessed</th>\n<th>Exploited</th>\n</tr>\n";
foreach($energy_all as $t => $data){
	$html_data .= "<tr>\n<td>$t</td>\n<td>".$data["harnessed"]."</td>\n<td>".$data["exploited"]."</td>\n</tr>\n";
}
$html_data .= "</table>\n";
$html_data .= "</body>\n</html>\n";
file_put_contents("energy_overview.html", $html_data);

//34
echo "\nHTML page created at energy_overview.html\n";

//35
echo "Starting investment calculator\n";
echo "Enter investment amount: ";
$investment = (float) trim(fgets(STDIN));
echo "Enter expected return rate (in %): ";
$return_rate = (float) trim(fgets(STDIN));
echo "Enter holding period (in years): ";
$holding_period = (int) trim(fgets(STDIN));

//36
$return_amount = $investment * pow((1+$return_rate/100), $holding_period);
echo "\nProjected return amount: ".$return_amount."\n";

//37
echo "Calculating returns from investment in clean energy\n";
$clean_energy_return = $return_amount * 0.2;
echo "Projected return from investing in clean energy: ".$clean_energy_return."\n";

//38
echo "Creating actionable plan for investment in clean energy\n";
$action_plan = "Invest ".$investment." with an expected return rate of ".$return_rate."% over a period of ".$holding_period." years to generate a projected return amount of ".$clean_energy_return.". These funds can then be used for further investments in clean energy sources.";
echo "Actionable plan:\n".$action_plan."\n";

//39
echo "Creating infographic for clean energy investments\n";
$infographic = "<html>\n<head>\n<title>Clean Energy Investing</title>\n</head>\n<body>\n";
$infographic .= "<h1>Clean Energy Investing</h1>\n";
$infographic .= "<p>Investing in clean energy sources is essential to fight climate change and reduce our dependance on fossil fuels. Here is an overview of how you can make smart investments in clean energy sources.</p>\n";
$infographic .= "<table>\n<tr>\n<th>Investment Amount</th>\n<th>Return Rate</th>\n<th>Holding Period</th>\n<th>Projected Return</th>\n</tr>\n";
$infographic .= "<tr>\n<td>".$investment."</td>\n<td>".$return_rate."%</td>\n<td>".$holding_period." years</td>\n<td>".$clean_energy_return."</td>\n</tr>\n";
$infographic .= "</table>\n";
$infographic .= "<p>With an actionable plan like this, you can start investing in clean energy sources and make a real difference!</p>\n";
$infographic .= "</body>\n</html>\n";
file_put_contents("energy_investing.html", $infographic);

//40
echo "\nInfographic created at energy_investing.html\n";
?>