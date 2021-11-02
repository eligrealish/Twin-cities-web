<?php

$config = array(
    'host' => 'mysql5',
    'username' => 'fet18035194',
	'password' => 'password1234',
	'database' => 'fet18035194',
	'flickrAPIKey' => 'e8f84e6c63367326f8e3aa2ebd47126e',
	'flickrAPIKeySecret' => '1ce1af3d673410c2',

);/*
$config = array(
    'host' => 'localhost',
    'username' => 'root',
	'password' => '',
	'database' => 'fet18035194',
	'flickrAPIKey' => 'e8f84e6c63367326f8e3aa2ebd47126e',
	'flickrAPIKeySecret' => '1ce1af3d673410c2',

);
*/
$host = $config['host'];
$username = $config['username'];
$password = $config['password'];
$database = $config['database'];
$apiKEY = $config['flickrAPIKey'];


function pullFlickr($tag){

$apiCallURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=".$GLOBALS['apiKEY']."&tags=".$tag."&tag_mode=&text=Cityscape&per_page=500&page=&format=json&nojsoncallback=1";

$imageObjectJSON = file_get_contents($apiCallURL);

$imageDataArray = json_decode($imageObjectJSON,true);

$imageData = $imageDataArray["photos"]["photo"];

shuffle($imageData);

return $imageData;
	
}


function insertQuery($imageData,$city_id){
	
	
	$conn = mysqli_connect($GLOBALS['host'],$GLOBALS['username'] ,$GLOBALS['password'] ,$GLOBALS['database']);
	
	$counter = 0;
	
		foreach($imageData as $data){
	
			if(!$data){
					continue;
				}
				
			if($counter == 10){
				break;
			}
				
			$id = $data["id"];

			$farm = $data["farm"];

			$server = $data["server"];

			$secret = $data["secret"];

			$title = $data["title"];

			$url = "https://farm".$farm.".staticflickr.com/".$server."/".$id."_".$secret.".jpg";
			
			
			$sql = "INSERT INTO `flicker`(`url`, `title`, `city_id`) VALUES ('$url','$title','$city_id')";	
			
			$conn->query($sql);
	
			$counter++;	
		}
		
	$conn->close();
}


function selectQuery($city_id){

	
	
	$conn = mysqli_connect($GLOBALS['host'],$GLOBALS['username'] ,$GLOBALS['password'] ,$GLOBALS['database']);
	
	$sql = "SELECT `url`, `title` FROM `flicker` WHERE city_id = $city_id";	
	
	
	$result = $conn->query($sql);
	
	
	$conn->close();
	
	return $result;
}


function sortData($result){
	
	$data = array();
	
	
	while($row = mysqli_fetch_assoc($result)) {
		
	$url = $row['url'];
		
	$title = $row['title'];
	
	array_push($data,array("url"=>$url,"title"=>$title));
	}
		
	shuffle($data);
	
	return $data;

}

function createSlideShow($data){
	
	echo "<div class='slideshow-container' data-cycle='3000'>" ;
	
	foreach($data as $item){
	$url = $item['url'];
	$title = $item['title'];
	echo "<div class='mySlides fade'>";
	echo "<img src='$url'>";
	echo "<div class='text'>$title</div>";
	echo "</div>";
	}
		
		
	echo "</div>";

}



$pullM = pullFlickr("Manchester");

$pullS = pullFlickr("Saint+Petersburg");

insertQuery($pullM,1);

insertQuery($pullS,2);

$queryM = selectQuery(1);

$queryS = selectQuery(2);

$queryM = sortData($queryM);

$queryS = sortData($queryS);


?>


<!DOCTYPE html>
<html>
<head>
<style> 
* {
    box-sizing: border-box;
}


button{
	position: center;
	margin: auto;
}

body {
    font-family: Verdana, sans-serif;
}

.mySlides {
display: inline-block;
position: relative;
}

img {
    vertical-align: middle;
	position: relative;
}

.slideshow-container {
	max-width: 500px;
	max-height: 265px;
	position: center;
	margin: auto;
    
}


.text {
    color: white;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
    font-size: 15px;
    padding: 8px 12px;
    position: absolute;
    width: 100%;
    text-align: center;
	bottom: 0%; 
	background: rgba(0, 0, 0, 0.8);
}

.active {
    background-color: #717171;
}


.fade {
    -webkit-animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-name: fade;
    animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}



.split {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
}

.left{
	left:0;	
}

.right{
	right:0;	
}

</style>
</head>
<body>
<div class ='split left'>

<?php createSlideShow($queryM);?>

<div>

<br>

<div class ='split right'>
<?php createSlideShow($queryS);?>

<div>

<script>

var slideshowContainers = document.getElementsByClassName("slideshow-container");

for(let s = 0; s < slideshowContainers.length; s++) {
    
    var cycle = slideshowContainers[s].dataset.cycle;

    var slides = slideshowContainers[s].querySelectorAll('.mySlides');
    var slideIndex = 0;

    showSlides(slides, slideIndex, cycle);
};

function showSlides(slides, slideIndex, cycle) {
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    };
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    };
    slides[slideIndex - 1].style.display = "block";
    setTimeout(function() {
        showSlides(slides, slideIndex, cycle)
    }, cycle);
};

</script>
</body>
</html>

