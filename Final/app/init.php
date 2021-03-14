<?php

require_once 'vendor/autoload.php';

use Elasticsearch\ClientBuilder;

$client = ClientBuilder::create()->setHosts(['127.0.0.1:9200'])->build();










//use "elasticsearch-7.11.1\\esphpsearch\\vendor\\elasticsearch\\src";


// $host = "127.0.0.1:9200";

// $host = '127.0.0.1';
// $port = 9200;


 


//  $es = $host.$port;

// $es = new Elasticsearch.Client([
//     'hosts' => ['127.0.0.1:9200']
// ]);


// $port =  9200;


//  $es = ClientBuilder::create("127.0.0.1:9200")->build;

// $es = oci_conect();

    
       



?>