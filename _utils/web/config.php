<?php
    $server_host = 'host_ip';
    $db_user = 'postgres';
    $db_password = 'db_pwd';

    $login_port = 6543;

    $db_gs = pg_connect("host=$server_host dbname=gf_gs user=$db_user password=$db_password");
    $db_ls = pg_connect("host=$server_host dbname=gf_ls user=$db_user password=$db_password");
    $db_ms = pg_connect("host=$server_host dbname=gf_ms user=$db_user password=$db_password");
?>