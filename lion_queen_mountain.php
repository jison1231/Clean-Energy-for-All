<?php
//This code creates an interactive map that displays the availability of clean energy around the world. 

//Declare global variables
$clean_energy_data;
$map_style;

//Include necessary library files
require_once 'library/map_style.php';
require_once 'library/clean_energy_data.php';

//Generate map
function generateMap(){
	global $clean_energy_data, $map_style;
	$map_data = array();
	foreach($clean_energy_data as $country_data){
		$map_data[] = array(
			'country_code' => $country_data['country_code'],
			'name' => $country_data['name'],
			'percent_clean_energy' => $country_data['percent_clean_energy']
		);
	}
	$map_style_formatted = json_encode($map_style);
	$map_data_formatted = json_encode($map_data);
	echo "<div id='map_container'></div>
	<script>
	var map_style = $map_style_formatted;
	var map_data = $map_data_formatted;
	generateMap(map_data, map_style);
	</script>";
}

//Generate table
function generateTable(){
	global $clean_energy_data;
	echo "<table>
	<tr>
		<th>Country</th>
		<th>Percent Clean Energy</th>
	</tr>";
	foreach($clean_energy_data as $country_data){
		echo "<tr>
				<td>$country_data[name]</td>
				<td>$country_data[percent_clean_energy]</td>
			</tr>";	
	}
	echo "</table>";
}

//Include necessary files
include 'library/map_style.php';
include 'library/clean_energy_data.php';

//Generate map and table
generateMap();
generateTable();
?>