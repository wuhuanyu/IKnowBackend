<?php


/**
 * Created by PhpStorm.
 * User: stack
 * Date: 10/9/16
 * Time: 8:19 PM
 */
class imageUploadHelper
{
    private static $target_dir="/var/www/html/uploads/";
    private $file;
    private $target_file;
    private $uploadOk=0;
    private $imageFileType;

    public function __construct($file)
    {
        $this->file=$file;
        $time=microtime();

        $this->target_file=imageUploadHelper::$target_dir.md5("".$time.basename($this->file["name"])).
            basename($this->file["name"]);

        echo $this->target_file;
        $this->imageFileType= pathinfo($this->target_file,PATHINFO_EXTENSION);
    }



    public function uplaod(){
        if(isset($_POST["submit"])){
            $check=getimagesize($this->file["tmp_name"]);
            if($check!==false){
                echo "File is an image-".$check["mime"].".";
                $this->uploadOk=1;
            }else{
                echo "File is not an image\n";
                $this->uploadOk=0;
            }
            if(file_exists($this->target_file)){
                $this->uploadOk=0;
                echo "Sorry,file already exists";
            }
            if($this->file["size"]>500000){
                $this->uploadOk=0;
                echo "sorry,your file is too large";
            }
            //$tmp=$this->imageFileType;
            //echo $tmp;
           // echo "test";
         //  if($tmp!="jpg"&&$tmp!="png"&&$tmp!="gif"&&$tmp!="jpeg"){
         //       $this->uploadOk=0;
         //       echo "Sorry Wrong file type";
         //   }


            if($this->uploadOk==0){
                echo "Sorry Error happened";
            }
            else{
                $time=microtime();
                if(move_uploaded_file($this->file["tmp_name"],$this->target_file)){
                    echo "File uploaded";
                }
                else{
                    echo "Sorry, there was an error";
                }
            }

        }
    }



}
