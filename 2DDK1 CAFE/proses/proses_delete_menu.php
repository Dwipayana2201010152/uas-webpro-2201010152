<?php
include "connect.php";
$id = (isset($_POST['id'])) ? htmlentities($_POST['id']) : "";
$foto = (isset($_POST['foto'])) ? htmlentities($_POST['foto']) : "";


if(!empty($_POST['input_user_validate'])){
    $query = mysqli_query($conn, "DELETE FROM tb_daftarmenu WHERE id = '$id'");
    if($query){
        unlink("../assets/img/$foto");
        $massage = '<script>alert("Data Berhasil Dihapus");
                    window.location="../menu"</script>';
    }else{
        $massage = '<script>alert("Data Gagal Dihapus")
                    window.location="../menu"</script>';   
    }
}echo $massage;
?>
