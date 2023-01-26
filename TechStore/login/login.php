<?php
    session_start();

    $dsn = "mysql:host=localhost; dbname=login";
    $username = "root";
    $password = "";
    $errorMsg = "";
    global $current_user;

    $db = new PDO($dsn, $username, $password);

    if(isset($_POST["login"]))
    {
        if(empty($_POST["uname"]) || empty($_POST["pass"]))
        {
            $errorMsg = '<p style="color: red; font-size: 24pt;"> ERROR: Username and Password cannot be blank </p>';
        }

        else
        {
            $query = "SELECT * FROM user WHERE uname = :uname AND pass = :pass";
            $statement = $db->prepare($query);
            $statement->execute(

                array('uname' => $_POST["uname"],
                      'pass' => $_POST["pass"])

            );

            $counter = $statement->rowCount();

            if($counter > 0){
                $_SESSION["uname"] = $_POST["uname"];
                $currentUser = $_SESSION["uname"];
                header("Location:usermenu.php");
            } else {
                $adminQuery = "SELECT * FROM administrator WHERE uname = :uname AND pass = :pass";
                $Astatement = $db->prepare($adminQuery);
                $Astatement->execute(
    
                    array('uname' => $_POST["uname"],
                          'pass' => $_POST["pass"])
    
                );
    
                $Acounter = $Astatement->rowCount();
    
                if($Acounter > 0){
                    $_SESSION["uname"] = $_POST["uname"];
                    $currentUser = $_SESSION["uname"];
                    header("Location:menu.php");
                } else{
                    $errorMsg = '<p style="color: red; font-size: 16pt;"> ERROR: Username and/or password are incorrect! </p>';

                }
            }       
        }
    }

?>

<!DOCTYPE html>
<html>
    <body>
        <p></p>
        <form method="POST">
            <input type="text" name="uname">
            <br>
            <input type="password" name="pass">
            <br>
            <input type="submit" value="Login" name="login">
        </form>
        <p><a href="registration.php">Register an Account!</a></p>


        <?php
            if(isset($errorMsg)){
                echo '<span>' . $errorMsg . '</span>';
            }
        ?>
    </body>
</html>