<?php
    require_once 'app/init.php';

    if(isset($_GET['q']))
    {
        echo 'ALhamdulliah';
        $q = $_GET['q'];

        $query = $client -> search([

                

        ]);

    }


?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Search | ES</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <form action="index.php" method="get" autocomplete="off">
        <label>
            Search for something
            <input type="text" name="q">
        </label>
        <input type="submit" value="Search">
    </form>
</body>
</html>