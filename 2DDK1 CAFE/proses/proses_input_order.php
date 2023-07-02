<?php
session_start();
include "connect.php";
$kode_order = (isset($_POST['kode_order'])) ? htmlentities($_POST['kode_order']) : "";
$meja = (isset($_POST['meja'])) ? htmlentities($_POST['meja']) : "";
$pelanggan = (isset($_POST['pelanggan'])) ? htmlentities($_POST['pelanggan']) : "";
$catatan = (isset($_POST['catatan'])) ? htmlentities($_POST['catatan']) : "";

if(!empty($_POST['input_order_validate'])){
    $select = mysqli_query($conn, "SELECT * FROM tb_order WHERE id_order = '$kode_order'");
    if (mysqli_num_rows($select) > 0){
        $massage = '<script>alert("Order yang dimasukkan telah ada");
                    window.location="../order"</script>';

}else{
    $query = mysqli_query($conn, "INSERT INTO tb_order (id_order,meja,pelanggan,catatan,pelayan) values ('$kode_order','$meja','$pelanggan','$catatan','$_SESSION[id_resto]')");
    if ($query){
        $massage = '<script>alert("Data berhasil Dimasukkan");
                    window.location="../?x=orderitem&order='.$kode_order.'&meja='.$meja.'&pelanggan='.$pelanggan.'"</script>';    
    }else{
        $massage = '<script>alert("Data gagal Dimasukkan");
                    window.location="../order"</script>';
        }
    }
}
echo $massage;
