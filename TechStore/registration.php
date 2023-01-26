<?php
    session_start();

    $dsn = "mysql:host=localhost; dbname=login";
    $username = "root";
    $password = "";
    $errorMsg = "";

    $db = new PDO($dsn, $username, $password);

    if(isset($_POST["login"]))
    {
        if(empty($_POST["uname"]) || empty($_POST["pass"]))
        {
            $errorMsg = '<p style="color: red; font-size: 24pt;"> ERROR: Username and Password cannot be blank </p>';
        }

        else
        {
            $uname = $_POST["uname"];
            $pass = $_POST["pass"];
            $query = "INSERT INTO user (uname, pass) VALUES (:uname,:pass)";
            $statement = $db->prepare($query);
            $statement->bindValue(':uname', $uname);
            $statement->bindValue(':pass', $pass);
            $statement->execute();
            $statement->closeCursor();
            header("Location:index.php");
        }
    }
    

?>
<?php include 'view/header.php'; ?>

<!DOCTYPE html>
<html>
    <body>
        <h3>Register an Account:</h3>
        <form method="POST">
            <input type="text" name="uname">
            <br>
            <input type="password" name="pass">
            <br>
            <input type="submit" value="Register" name="login">
        </form>
        <p><a href="../index.php">Click to Login if you already have an account.</a></p>


        <?php
            if(isset($errorMsg)){
                echo '<span>' . $errorMsg . '</span>';
            }
        ?>
    </body>
</html>
<?php include 'view/loginFooter.php'; ?>
