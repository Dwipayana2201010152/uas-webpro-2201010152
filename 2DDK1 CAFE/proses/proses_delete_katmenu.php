<?php
include "connect.php";
$id = (isset($_POST['id'])) ? htmlentities($_POST['id']) : "";


if(!empty($_POST['hapus_kategori_validate'])){
    $select = mysqli_query($conn, "SELECT kategori FROM tb_daftarmenu WHERE kategori = '$id'");
    if (mysqli_num_rows($select) > 0){
        $massage = '<script>alert("Kategori telah digunakan pada daftar menu, kategori tidak dapat dihapus");
                    window.location="../katmenu"</script>';
    }else{
        $query = mysqli_query($conn, "DELETE FROM tb_kategori_menu WHERE id_kat_menu = '$id'");
        if($query){
            $massage = '<script>alert("Data Berhasil Dihapus");
                    window.location="../katmenu"</script>';
    }else{
            $massage = '<script>alert("Data Gagal Dihapus")
                    window.location="../katmenu"</script>';   
    }
}
}
echo $massage;
?>
