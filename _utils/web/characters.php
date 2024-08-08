<?php
include('config.php');

$accounts = pg_query($db_ls, "SELECT * FROM accounts");
?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <title> Grand Fantasia | Characters </title>
    <meta http-equiv='content-type' content='text/html' ; charset='UTF-8' />
    <style>
    table {
      min-width: 280px;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
    }
    th {
      background-color: #f2f2f2;
    }
    td:first-child {
      width: 100px;
    }
  </style>
</head>

<body>
    <center>
        <br>
        <input type='button' value='Back' onclick="window.location.href='index.php'" />
        <br>
        <h3> Grand Fantasia Characters </h3>
        <br>
        <?php
        while ($account = pg_fetch_assoc($accounts)) {
            echo "<table border='1'>";
            echo "<tr><th>Account</th><th>" . $account['username'] . "</th></tr>";
            $characters = pg_query($db_gs, "SELECT * FROM player_characters WHERE account_id = " . $account['id']);
            $count = 1;
            while ($character = pg_fetch_assoc($characters)) {
                echo "<tr><td>Character $count</td><td>" . $character['given_name'] . "</td></tr>";
                $count++;
            }
            echo "</table>";
            echo "<br>";
        }
        ?>
    </center>
</body>

</html>