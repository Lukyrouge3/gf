<?php
include('config.php');

$server_status = @fsockopen($server_host, $login_port, $err, $err, 1);

$characters_result = pg_query($db_gs, 'SELECT COUNT(*) FROM player_characters');
$num_characters = pg_fetch_result($characters_result, 0, 0);

$accounts_result = pg_query($db_ls, 'SELECT COUNT(*) FROM accounts');
$num_accounts = pg_fetch_result($accounts_result, 0, 0);

?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <title> Grand Fantasia | Status </title>
    <meta http-equiv='content-type' content='text/html' ; charset='UTF-8' />
</head>

<body>
    <center>
        <br>
        <input type='button' value='Back' onclick="window.location.href='index.php'" />
        <br>
        <h3> Grand Fantasia Status </h3>
        <br>
        <?php
        if (!$server_status) {
            echo "Server Status: <font color='red'>Offline</font><br><br>";
        } else {
            echo "Server Status: <font color='green'>Online</font><br><br>";
            fclose($server_status);
        }

        echo "<br>Registered Accounts: $num_accounts";
        echo "<br>Characters Created: $num_characters";
        ?>
    </center>
</body>

</html>