<?php

use Elasticsearch\ClientBuilder;
require 'vendor/autoload.php';

$client = ClientBuilder::create()
  ->setHosts(['localhost:9200'])
  ->build();
  
echo "ES client has been created.";


?>
