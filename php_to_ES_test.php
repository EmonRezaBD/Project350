<?php

use Elasticsearch\ClientBuilder;
require 'vendor/autoload.php';

$client = ClientBuilder::create()->build();
echo "ES client has been created.";


?>
