<?php

require 'bootstrap.php';
$config = require OMEKA_PATH . '/application/config/application.config.php';
$reader = new \Laminas\Config\Reader\Ini;
$testConfig = [
    'connection' => $reader->fromFile(OMEKA_PATH . '/application/test/config/database.ini'),
];
$config = array_merge($config, $testConfig);
$application = Omeka\Mvc\Application::init($config);

$services = $application->getServiceManager();
$connection = $services->get('Omeka\Connection');
while (1) {
    try {
        $connection->query('select 1');
    } catch (\Exception $e) {
        echo "Waiting for database...\n";
        sleep(1);
        continue;
    }
    break;
}
