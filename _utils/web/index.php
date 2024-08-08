<?php
include('config.php');

$message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (!empty($username) && !empty($password)) {
        $result_exists = pg_query($db_ls, "SELECT * FROM accounts WHERE username='$username'");
        if (pg_num_rows($result_exists) > 0) {
            $message = "<font color='red'>USERNAME '$username' ALREADY REGISTERED</font>";
        } else {

            $result = pg_query($db_ls, 'SELECT COUNT(*) FROM accounts');
            $next_id = pg_fetch_result($result, 0, 0);
            $next_id++;

            $exists_id = pg_query($db_ls, "SELECT * FROM accounts WHERE id = $next_id");
            while (pg_num_rows($exists_id) > 0) {
                $next_id++;
                $exists_id = pg_query($db_ls, "SELECT * FROM accounts WHERE id = $next_id");
            }

            $pwd_md5 = md5($password);

            $result_ls = pg_query($db_ls, "INSERT INTO public.accounts (id, username, password, realname) VALUES($next_id, '$username', '$pwd_md5', '$username')");

            if (!$result_ls) {
                $message = "<font color='red'>ACCOUNT CREATION ERROR</font>";
            } else {
                $result_ms = pg_query($db_ms, "INSERT INTO tb_user (mid, password, pwd, idnum) VALUES ('$username','$pwd_md5','$pwd_md5', $next_id)");
                if (!$result_ms) {
                    $message = "<font color='red'>ACCOUNT CREATION ERROR</font>";
                } else {
                    $message = "<font color='green'>ACCOUNT '$username' CREATED</font>";
                }
            }

            pg_close($db_ls);
            pg_close($db_ms);
        }
    }
}
?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <title> Grand Fantasia | Registration </title>
    <meta http-equiv='content-type' content='text/html' ; charset='UTF-8' />
</head>

<body>
    <center>
        <form id='register' action="<?= $_SERVER['PHP_SELF']; ?>" method=post>
            <br>
            <input type='button' value='Server Status' onclick="window.location.href='status.php'" />
            <input type='button' value='Add AP' onclick="window.location.href='gold.php'" />
            <input type='button' value='Characters' onclick="window.location.href='characters.php'" />
            <input type='button' value='Change Privilege' onclick="window.location.href='gm.php'" />
            <input type='button' value='Change Player Name' onclick="window.location.href='change.php'" />
            <br>
            <h3> Grand Fantasia Register </h3>
            <br>
            USERNAME<br>
            <input class='input_box' type=text name=username><br>
            PASSWORD<br>
            <input class='input_box' type=password name=password><br>
            <br>
            <input class='input_submit' type=submit name=submit value='Create Account'><br>
            </table>
        </form>
        <?php
        echo "<p>$message</p>";
        ?>
</body>

</html>