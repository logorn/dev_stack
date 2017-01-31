#! /bin/bash

curl "http://localhost:9200"

# Insert data

curl -XPUT 'http://localhost:9200/blog/user/dilbert' -d '{ "name" : "Dilbert Brown" }'

curl -XPUT 'http://localhost:9200/blog/post/1' -d '
{
    "user": "dilbert",
    "postDate": "2011-12-15",
    "body": "Search is hard. Search should be easy." ,
    "title": "On search"
}'

curl -XPUT 'http://localhost:9200/blog/post/2' -d '
{
    "user": "dilbert",
    "postDate": "2011-12-12",
    "body": "Distribution is hard. Distribution should be easy." ,
    "title": "On distributed search"
}'

curl -XPUT 'http://localhost:9200/blog/post/3' -d '
{
    "user": "dilbert",
    "postDate": "2011-12-10",
    "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat" ,
    "title": "Lorem ipsum"
}'

# Verification of inserted data

curl -XGET 'http://localhost:9200/blog/user/dilbert?pretty=true'
curl -XGET 'http://localhost:9200/blog/post/1?pretty=true'
curl -XGET 'http://localhost:9200/blog/post/2?pretty=true'
curl -XGET 'http://localhost:9200/blog/post/3?pretty=true'

# Searching

curl 'http://localhost:9200/blog/post/_search?q=user:dilbert&pretty=true'

# Retrieve the title of all posts which contain search and not distributed:

curl 'http://localhost:9200/blog/post/_search?q=+title:search%20-title:distributed&pretty=true&fields=title'