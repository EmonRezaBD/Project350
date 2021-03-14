<?php
    require_once 'app/init.php';

    // require_once 'vendor/autoload.php';
    // use Elasticsearch\ClientBuilder;

    // $client = ClientBuilder::create()->setHosts(['127.0.0.1:9200'])->build();

    if(!empty($_POST))
    {
        if(isset($_POST['title'], $_POST['body'], $_POST['keywords']))
        {
            $title = $_POST['title'];
            $body = $_POST['body'];
            $keywords = explode(',' , $_POST['keywords']);

            echo 'Debug Ok';

            $indexed = $client->index([
                 'index' => 'articles',
                 'type' => 'article',
                 'body' =>[
                     'title' => $title,
                     'body' => $body,
                     'keywords' => $keywords
                         ]    
            ]);
            // $indexed = [
            //     'index' => 'articles',
            //     'type' => 'article',
            //     'body' =>[
            //         'title' => $title,
            //         'body' => $body,
            //         'keywords' => $keywords
            //     ]    
            // ];
            if($indexed)
            {
                print_r($indexed);
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add | ES</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <form action="add.php" method="post" autocomplete="off">
        <label>
            Title
            <input type="text" name="title">
        </label>
        <label>
            Body
            <textarea rows="8" name="body"></textarea>
        </label>
        <label>
            Keywords
            <input type="text" name="keywords" placeholder="csv">
        </label>
        <input type="submit" value="Add">
    </form>
</body>
</html>