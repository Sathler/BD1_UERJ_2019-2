<?php
include_once "crud.php";
//var_dump($_GET);
removerBrinquedoFunc($_GET['cpf'], $_GET['tel']);
header("Location: update_funcionario.php?cpf=".$_GET['cpf']);
?>