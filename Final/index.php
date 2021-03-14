<?php

require_once 'app/init.php';


?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Search | ES</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <form action="/elasticsearch-7.11.1/esphpsearch/index.php" method="POST" autocomplete="off">
        <label>
            Search for something
            <input type="text" name="q">
        </label>
        <input type="submit" value="Search">
    </form>

    
   <?php

if(!empty($_POST)) {
    $q = $_POST['q'];
    $params = [
        'index' => 'articles',
        'body'  => [
            'query' => [
                'match' => [
                    'keywords' => $q
                ]
            ]
        ]
    ];
    
    $result = $client->search($params);
    print_r($result);
}



        // echo $query['_source'] ['title'];
        //echo "Array: <br>";
        
        // foreach($query['_id'] as $result)
        // {
        //     echo $result['_id'], '<br>';
        // }

       // print_r($query);
        // echo $query[article[_id]];

       // if(isset($results))
      //  {
            // foreach($results as $r)
            // {
               /* ?>
                
                   <div class ="result">
                      <a href = "#<?php echo $r['_id']; ?>" > <?php echo $r['_source'] ['title']; ?> </a>
                      <div class = "result-keywords"> <?php implode(', ', $r['_source']['keywords']); ?>
                  </div>
                  

               <?php */

              
            // }
       // }
            //var_dump($results);
            //foreach($results as $r)
            //{
            //    var_dump($r);
            //}

    ?>

</body>
</html>