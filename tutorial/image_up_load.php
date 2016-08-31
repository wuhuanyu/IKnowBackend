<?php
//$target_dir="tutorial/uploads/";
//$target_file=$target_dir.basename($_FILES["fileToUpload"]["name"]);
//
//
//$filenamekey=md5(uniqid($_FILES["fileToUpload"]["name"],true));
//echo $filenamekey;
//$extention=pathinfo($_FILES["fileToUpload"]["name"],PATHINFO_EXTENSION);
//echo $extention;
//$filenamekey.=".".$extention;
//echo "<br>";
//echo $filenamekey;
//move_uploaded_file($_FILES["fileToUpload"]["tmp_name"],$target_dir.$filenamekey);

//echo $target_file;
//echo "<br>";
//echo $_FILES["fileToUpload"];
//echo md5_file($_FILES["fileToUpload"]["name"],false);

$target_dir="/var/www/html/uploads/";
if(isset($_FILES["fileToUpload"])){
  $file=$_FILES["fileToUpload"];
  $file_name=$file['name'];
  $file_size=$file['size'];
  $file_tmp=$file["tmp_name"];
  $file_type=$file["type"];

  $target_file=$target_dir.basename($file_name);
  $file_new_name=md5(uniqid($file_name));
  echo $file_new_name;
  $file_ext=pathinfo($target_file,PATHINFO_EXTENSION);
  echo $target_file;
  //echo $file_tmp;
  //echo $file_ext;
  if(move_uploaded_file($file["tmp_name"],$target_dir.$file_new_name.'.'.$file_ext)){
      echo "Successfully";
}
 // $file_ext=pathinfo()
}




?>
