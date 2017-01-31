<?php

$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");

// build bulk object
$bulk = new MongoDB\Driver\BulkWrite;
$bulk->insert(['x' => 1]);
$bulk->insert(['x' => 2]);
$bulk->insert(['x' => 3]);

// insert data
$manager->executeBulkWrite('db.collection', $bulk);

$filter  = ['x' => ['$gt' => 1]];
$options = ['projection' => ['_id' => 0], 'sort' => ['x' => -1]];

// execute query to retrieve data
$query   = new MongoDB\Driver\Query($filter, $options);
$cursor  = $manager->executeQuery('db.collection', $query);

foreach ($cursor as $document) {
    var_dump($document);
}

// check driver manager
var_dump($manager);
