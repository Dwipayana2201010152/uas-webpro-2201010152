<?php
include "connect.php";
$name = (isset($_POST['nama'])) ? htmlentities($_POST['nama']) : "";
$username = (isset($_POST['username'])) ? htmlentities($_POST['username']) : "";
$level = (isset($_POST['level'])) ? htmlentities($_POST['level']) : "";
$nohp = (isset($_POST['nohp'])) ? htmlentities($_POST['nohp']) : "";
$alamat = (isset($_POST['alamat'])) ? htmlentities($_POST['alamat']) : "";
$password = md5('password');

if(!empty($_POST['input_user_validate'])){
    $query = mysqli_query($conn, "INSERT INTO tb_user (nama,username,level,nohp,alamat,
    password) values ('$name','$username','$level','$nohp','$alamat','$password')");
    if($query){
        $massage = '<script>alert("Data Berhasil Dimasukkan");
                    window.location="../user"</script>
                    </script>';
    }else{
        $massage = '<script>alert("Data Gagal Dimasukkan")</script>';    
    }
}echo $massage;
?>