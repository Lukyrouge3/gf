<?php
include('config.php');

$message = '';

if (isset($_POST['submit'])) {
    $playername = $_POST['playername'];
    $privilege = $_POST['privilege'] == 'Add GM' ? 5 : 0;
    $query = "SELECT account_id FROM player_characters WHERE given_name='$playername'";
    $result = pg_query($db_gs, $query);
    $row = pg_fetch_assoc($result);
    if (!$row) {
        $message = "<font color='red'>PLAYER NOT FOUND</font>";
    } else {
        $account_id = $row['account_id'];

        $pquery = "UPDATE player_characters SET privilege = $privilege WHERE given_name='$playername'";
        $result = pg_query($db_gs, $pquery);

        $query = "SELECT username FROM accounts WHERE id='$account_id'";
        $result = pg_query($db_ls, $query);
        $row = pg_fetch_assoc($result);

        $username = $row['username'];

        $query = "UPDATE tb_user SET byauthority = $privilege WHERE mid = '$username'";
        $result = pg_query($db_ms, $query);

        if ($result) {
            $message = "<font color='green'>SUCCESS UPDATING '$playername' PRIVILEGE</font>";
        } else {
            $message = "<font color='red'>ERROR UPDATING '$playername' PRIVILEGE</font>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <title> Grand Fantasia | GM </title>
    <meta http-equiv='content-type' content='text/html' ; charset='UTF-8' />
</head>

<body>
    <center>
        <br>
        <input type='button' value='Back' onclick="window.location.href='index.php'" />
        <br>
        <h3> Grand Fantasia GM </h3>
        <br>
        <form action='' method='post'>
            <label for='playername'>Player Name:</label>
            <input type='text' id='playername' name='playername'>
            <br>
            <label for='privilege'>Privilege:</label>
            <select id='privilege' name='privilege'>
                <option value='Add GM'>Add GM</option>
                <option value='Remove GM'>Remove GM</option>
            </select>

            <input type='submit' name='submit' value='Update Privilege'>
        </form>
        <p><?php echo $message;
            ?></p>
    </center>
</body>

</html>