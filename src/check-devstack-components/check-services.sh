#!/bin/bash

# Define an array of processes to be checked.
# If properly quoted, these may contain spaces
check_process=( "nginx" "mysql" "mongo" "php-fpm" "apache2" )

for p in "${check_process[@]}"; do
    if pgrep "$p" > /dev/null; then
        echo "Process \`$p' is running"
    else
        echo "Process \`$p' is not running"
    fi
done

# Check elasticsearch service
check_process=( "http://localhost:9200/_stats" )

for p in "${check_process[@]}"; do
    if curl -XGET "$p" > /dev/null; then
        echo "Process ElasticSearch is running"
    else
        echo "Process ElasticSearch is not running"
    fi
done
