<?php
include('config.php');

$message = '';

$list = array('fuck');

if (isset($_POST['submit'])) {
    $oldname = $_POST['oldname'];
    $newname = $_POST['newname'];
    if (strlen($newname) < 4 || preg_match('/\s/', $newname)) {
        $message = "Invalid PlayerName: SHULD NOT CONTAIN SPACES OR LASS THAN 4 CHARACTERES";
    } else {

        $query = "SELECT account_id FROM player_characters WHERE given_name='$oldname'";
        $result = pg_query($db_gs, $query);
        $row = pg_fetch_assoc($result);
        if (!$row) {
            $message = "<font color='red'>PLAYER '$oldname' NOT FOUND</font>";
        } else {
            $block_special_characteres = false;
            if ($block_special_characteres && preg_match('/[^a-zA-Z0-9 ]/', $newname)) {
                $message = "CAN'T USE NAME WITH SPECIAL CHARACTER";
            } else {
                $name_lower = strtolower($newname);

                $word_found = '';
                foreach ($list as $word) {
                    if (preg_match("/$word/", $name_lower)) {
                        $word_found = $word;
                        break;
                    }
                }

                if (!empty($word_found)) {
                    $message = "INVALID NAME '$newname' MUST NOT CONTAINS '$word_found'";
                } else {
                    $query = "SELECT account_id FROM player_characters WHERE given_name='$newname'";
                    $result = pg_query($db_gs, $query);
                    $row = pg_fetch_assoc($result);
                    if ($row) {
                        $message = "<font color='red'>PLAYER '$newname' ALREADY EXISTS</font>";
                    } else {
                        $query = "UPDATE player_characters SET given_name = '$newname' WHERE given_name = '$oldname'";
                        $result = pg_query($db_gs, $query);

                        if ($result) {
                            $message = "<font color='green'>SUCCESS CHANGING PLAYER NAME FROM '$oldname' TO '$newname'</font>";
                        } else {
                            $message = "<font color='red'>ERROR CHANGING '$oldname' NAME</font>";
                        }
                    }
                }
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <title> Grand Fantasia | Change Name </title>
    <meta http-equiv='content-type' content='text/html' ; charset='UTF-8' />
</head>

<body>
    <center>
        <br>
        <input type='button' value='Back' onclick="window.location.href='index.php'" />
        <br>
        <h3> Grand Fantasia Change Name </h3>
        <br>
        <form action="<?= $_SERVER['PHP_SELF']; ?>" method='post'>
            <label for='playername'>Old Player Name:</label>
            <input type='text' id='oldname' name='oldname'>
            <br>
            <label for='playername'>New Player Name:</label>
            <input type='text' id='newname' name='newname'>
            <br>
            <input type='submit' name='submit' value='Change Name'>
        </form>
        <p><?php echo $message;
            ?></p>
    </center>
</body>

</html>