<?php
#including config file to hold static data, like api keys,database log in,
#and the city co ordinates
$config = array(
    'host' => 'mysql5',
    'username' => 'fet18035194',
	'password' => 'password1234',
	'database' => 'fet18035194',
  'flickrAPIKey' => 'e8f84e6c63367326f8e3aa2ebd47126e',
	'flickrAPIKeySecret' => '1ce1af3d673410c2',
	'googleAPIKey' => 'AIzaSyD0GK-815VQUBoQyJyTBxAkdjeai9Qv5DA',
	'latM' => '53.4785',
	'lonM' => '-2.2430',
	'latS' => '59.9343',
	'lonS' => '30.3351'
);
#pulling data from config file and assigning to variable in php
$host = $config['host'];
$username = $config['username'];
$password = $config['password'];
$database = $config['database'];
$apiKEY = $config['googleAPIKey'];

$latM = $config['latM'];
$lonM = $config['lonM'];
$latS = $config['latS'];
$lonS = $config['lonS'];

#function to pull data from database
function selectQuery($sql){
	#creating object for connecting to database
	$conn = mysqli_connect($GLOBALS['host'],$GLOBALS['username'] ,$GLOBALS['password'] ,$GLOBALS['database']);

	#parsing SQL statement to database and assigning result to variable 
	$result = $conn->query($sql);
	
	#itterating over object returned from database to pull all of the dataout
	if ($result->num_rows > 0) { 	
		while($row = $result->fetch_assoc()) {
			$poi[$row['poi_id']] = array(
			'name' => $row['Name'],
			'lat' => $row['Latitude'],
			'lon' => $row['Longitude'],
			'textbody' => $row['Description'],
			'link' => $row['Link'],
			'rating' => $row['Rating'],
			'city_id' => $row['city_id'],
			);
		}
	} 

	#closing database and returning converted data
	$conn->close();
	return $poi;
}



#function to create html strings
function createHTML($poi){
			
				
	$conn = mysqli_connect($GLOBALS['host'],$GLOBALS['username'] ,$GLOBALS['password'] ,$GLOBALS['database']);		
		

	#blank array to store all poi data
	$poidata = array();		
	
	
	
		
	#itterating all sorted data
	foreach($poi as $i => $item){
			
			#when the data was sorted the poi_key became the array key
			#so here we can use that to idendify what poi_key connects
			#to what photo
			$sql = "SELECT `url` FROM `Photos` WHERE poi_id = $i";
			
			#blank array to store url for photo location
			#errased every itteration so that the photo position will
			#remain the same when creating the hover over string
			$URLs = array();
			
			
			#using this statement to query database
			$result = $conn->query($sql);
			
			#looping through result object to assign the URLs to 
			#array
			
			while($row = $result->fetch_assoc()){
				$url = $row['url'];
				
				array_push($URLs,$url);
				
			}
			
			#taking all relvent data for each itteration
			#to be made into html strings
			$name = $item['name'];
			
			$textbody = $item['textbody'];
			
			$link = $item['link'];
			
			$rating = $item['rating'];
			
			$lat = $item['lat'];
			
			$lon = $item['lon'];
			
			#html strings created with photos for when you click over it
			$htmlMouseClick = '<h1>'.$name.'</h1> <p>'
			.$textbody.'</p> Attribution: '
			.$name.', <a href="'.$link.'">'.$link.'</a>'
			.'<br> <img src='."$URLs[0]".'>'
			.'<img src='."$URLs[1]".'>'
			.'<img src='."$URLs[2]".'>'
			;
			
			#html string created for when mouse hovers open
			$htmlMouseOver = '<h1>'.$name.'</h1> <p>'.$rating.'</p>';
			
			#adding array with co ordinates, with mouse click and mouse over strings
			#to other array so it's nested
			array_push($poidata,array($lat,$lon,$htmlMouseClick,$htmlMouseOver));
	}

	
	$conn->close();
	#array of array with lat lon, mouse click and mouse over is returned so
	#JS can itterate and draw points
	return $poidata;
	
}


$sql = "SELECT * FROM `Poi` WHERE city_id = 1";


$poiMan = selectQuery($sql);
$poiMan = createHTML($poiMan);

$sql = "SELECT * FROM `Poi` WHERE city_id = 2";


$poiStP = selectQuery($sql);
$poiStP = createHTML($poiStP);






?>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<style>


</style>
</head>
<body>

<div class="split left">
  <div class="centered">
  
	<!--JS can identify map by id -->
	<div id="manchester" style="width:500px; height:400px;"></div>
	
    </div>
</div>




<div class="split right">
  <div class="centered">
	
	<div id="stpetersbrough" style="width:500px; height:400px;"></div>
    </div>
</div>




<script>
//parsing lat and lon from php to js by ecoding as json and then translating to float
var latM = parseFloat(<?php echo json_encode($latM); ?>);
var lonM = parseFloat(<?php echo json_encode($lonM); ?>);

var latS = parseFloat(<?php echo json_encode($latS); ?>);
var lonS = parseFloat(<?php echo json_encode($lonS); ?>);


//parsing co ordinates and html of points of intrest from php
var poisMan = <?php echo json_encode($poiMan); ?>;
var poisStP = <?php echo json_encode($poiStP);?>;


//function to place marker on map
function placeMarker(poi,contentString,hoverString,map){

	//creating popup window when point is clicked on
  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  
  //creating popup window when point is hovered over
  var hoverwindow = new google.maps.InfoWindow({
    content: hoverString
  });

  //placing marker
  var marker = new google.maps.Marker({position: poi, map: map});

  //attachting click window to marker
  marker.addListener('click', function() {
    infowindow.open(map, marker);
    });

	//attaching hover window to marker and setting it to appear when mouse hovers over
  marker.addListener('mouseover', function() {
      hoverwindow.open(map, marker);
    });

	//making mouse disapear when hovered over
    marker.addListener('mouseout', function() {
      hoverwindow.close(map, marker);
    });

}
function initMap() {
  
	//creating each of the maps with imported co ordinates
    var myOptionsMan = {
        zoom: 12,
        center: new google.maps.LatLng(latM,lonM),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
	
	var myOptionsStP = {
        zoom: 9,
        center: new google.maps.LatLng(latS, lonS),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
	
	//assigning maps to html ids
    mapMan = new google.maps.Map(document.getElementById("manchester"), myOptionsMan);

   mapStP = new google.maps.Map(document.getElementById("stpetersbrough"), myOptionsStP);
	
	//itterating over each map for the length of the points of intrest to place on map
	for(i = 0; i < poisMan.length; i++){
		var location = {lat:parseFloat(poisMan[i][0]),lng:parseFloat(poisMan[i][1])};
		var mouseClick = poisMan[i][2];
		var mouseOver = poisMan[i][3];	
		placeMarker(location,mouseClick,mouseOver,mapMan);
		
	}
	
	for(i = 0; i < poisStP.length; i++){
		var location = {lat:parseFloat(poisStP[i][0]),lng:parseFloat(poisStP[i][1])};
		var mouseClick = poisStP[i][2];
		var mouseOver = poisStP[i][3];	
		placeMarker(location,mouseClick,mouseOver,mapStP);
		
	}
}



</script> 

<?php 
#php echo use in order to include api key from config file
echo "<script async defer src='https://maps.googleapis.com/maps/api/js?key=$apiKEY&callback=initMap'> </script> "; 
?>


    
</body>
</html> 