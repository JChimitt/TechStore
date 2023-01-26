<?php
    session_start();
    echo '<p style="color: blue; font-size: 32pt">Nice! Welcome ' . $_SESSION["uname"] . ' </p>';
    echo '<a href="logout.php">Click me to Logout!</a>';
?>