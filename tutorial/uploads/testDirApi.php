<?php
//$dir=opendir("/tmp/");
$dir="/tmp/";
if(is_dir($dir)){
    if($dh=opendir($dir)){
        while(($file=readdir($dh))!==false){
            var_dump($file);
            //echo "fileName: ".$file.filetype($dir.$file)."\n";
}

closedir($dh);
}

}


$imageDir="/var/www/html/uploads/pic.jpg";
//$images=glob($imageDir."*.jpg");

$handler=fopen($imageDir,"r");

ob_start();
imagepng($handler);
$output=ob_get_contents();
ob_end_clean();

echo '<img src="data:image/png;base64,'.base64_encode($output).'>"'; //foreach($images as $image){
 //   var_dump($image);
  //  echo "\n";
//}




?>
