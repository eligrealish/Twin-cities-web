<?php
#XML Header
header('Content-type: text/xml');
#Setting up the connection to the Database
$conn = mysqli_connect('mysql5', 'fet18035194', 'password1234','fet18035194');
		
#Declaring the xml and rss versions
$rssfeed = '<?xml version="1.0" encoding="UTF-8"?>';
$rssfeed .= '<rss version="2.0">';
$rssfeed .= '<channel>';
$rssfeed .= '<title>RSS for Manchester and ST Petersburg</title>';
$rssfeed .= '<cities>';

#1.Setting up query to grab all info from the city table
#2.Query the database with the query just established
#3.While loop to fetch data from every row in the city table
$sql_city = "SELECT * FROM City";
$city_query = mysqli_query($conn, $sql_city);
while($row = mysqli_fetch_assoc($city_query)){ 
	#Display collected data from all the attributes in the city table.
	$rssfeed .= '<city>
	<city_id>' . $row['city_id'] . '</city_id>
	<city_name>' . $row['name'] . '</city_name>
	<country>' . $row['country'] . '</country>
	<population>' . $row['population'] . '</population>
	<city_latitude>' . $row['latitude'] . '</city_latitude>
	<city_longitude>' . $row['longitude'] . '</city_longitude>
	<city_description>' . $row['description'] . '</city_description>
	<city_currency>' . $row['currency'] . '</city_currency>
	<city_website>' . $row['website'] . '</city_website>
	<pois>';

#Used to filter the points of interests by their city id which is the foreign key in the poi table
#1.Setting up query to grab all info from poi table seperated by the city which they correspond to.
#2.Query the database with the query just established

$city_id = $row['city_id']; 
$sql_poi = "SELECT * FROM Poi JOIN City ON Poi.city_id=City.city_id WHERE City.city_id = $city_id";
$poi_query = mysqli_query($conn, $sql_poi);

#While loop to fetch data from every row in the poi table
while($row = mysqli_fetch_assoc($poi_query)){ 
	$rssfeed .= '<poi>
		<poi_id>' . $row['poi_id'] . '</poi_id>
		<poi_name>' . $row['Name'] . '</poi_name>
		<poi_latitude>' . $row['Latitude'] . '</poi_latitude>
		<poi_longitude>' . $row['Longitude'] . '</poi_longitude>
		<poi_description>' . $row['Description'] . '</poi_description>
		<poi_website>' . $row['Link'] . '</poi_website>
		<poi_rating>' . $row['Rating'] . '</poi_rating>
		<poi_city_id>' . $row['city_id'] .'</poi_city_id>
		<photos>';
		
		#Used to filter the photos by their poi id which is the foreign key in the poi table
		#1.Setting up query to grab all info from photo table seperated by the poi which they correspond to.
		#2.Query the database with the query just established
		$poi_id = $row['poi_id'];
		$sql_photo = "SELECT * FROM Photos JOIN Poi ON Photos.Poi_id=Poi.poi_id WHERE Poi.poi_id = $poi_id";
		$photo = mysqli_query($conn, $sql_photo);
		#While loop to fetch data from every row in the photos table
		while($row = mysqli_fetch_assoc($photo)){
			$rssfeed .='<photo>
			<photo_id>' . $row['photo_id'] . '</photo_id>
			<photo_url>' . $row['url'] . '</photo_url>
			</photo>';
		}
	$rssfeed .= '</photos>
	</poi>';
}
$rssfeed .= '</pois>
</city>';

}
$rssfeed .= '</cities>
</channel>
</rss>';
echo $rssfeed;

?>