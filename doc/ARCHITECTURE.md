# DevStack Architecture Overview

### Software delivery and standardization

### Ready to use

You can imagine devStack as a template in order to build your project with best components.

![Architecture Diagram](architecture.jpg?raw=true "Architecture overview")

**Ansible** acts as the tool for automation and control of environments.
- The developer initiates the provisioning of its application and benefits from a stable and tested environment.

**Vagrant** will take advantage of the automation elements of ansible and will allow operation via virtualbox
- The specifications of the machines are clear and accessible quickly and modifiable for each type of project.
- Vagrant is supported by HashiCorp.

**Virtualbox** is a cross-platform virtualization hypervisor application and it's free.

**Nginx** will be used as the main web server for different applications which can not function without.
- It will be interfaced initially with php-fpm.

**Apache2** will be used as a reverse proxy and load-balancer 
- This solution is very widespread and Apache2 is known for its strong community and the richness of its extensions.

**Mongodb** will make it possible to manage the exploitation of data having a high volumetry.
- Mongo time to stand out as the document-oriented database.
- The exploitation of mongo and mysql allows the deployment of a hybrid project benefiting from the advantages of each one.
- It is necessary to identify data that does not need to be stored in a relational database and take advantage of the destructured data storage advantages

Good Use Cases for MongoDB are as follows:

- Your data is in a document format, i.e. irregular structure in single documents (that is data doesn't need to be joined).
- You are considering using a flat file system (again due to the structure of your data), but you would like 'more' in terms of ability to index/query that data.
- Your project is in a state where you genuinely don't know what the schema or structure of your data will ultimately be.
- You have specialized data types, such as geo-spatial data, and you want to be able to query against it.
- You may have a need to quickly and cheaply scale your data storage location.
- Horizontal Scalability and High Availability
- Fast writes in the fire-and-forget mode
- Comprehensive Querying and Aggregation Framework
- Comparatively intuitive architecture
- You can for example have read-intensive data in MongoDB.
- MongoDB can be used as caching/intermediate storage for speed.

Reasons not to choose Mongo:

- No SQL = No Joins
- No ACID transactions
- Your indexes would not fit into memory

**MySQL** will be used as the primary storage.
- The data for generating reports is perfect for a relational system like MySQL.
- In order to use transactions and heavy T-SQL functionality, then you'd be better served by using a RDBMS such as MySQL.

**Elasticsearch** is the solution that tends to supplant Solr by its simplicity of installation and operation.

Reasons to choose Elasticsearch:

- Full-text search capabilities
- Using the REST API
- Distributed
- Schema-free JSON documents
- Readily-scalable
- More performant than Sql search
- It's use Query DSL language
- Data are indexed by document
- Denormalized Document Storage: Fast, Direct access to your Data
- Broadly Distributable and Highly Scalable.
- Partitioning your documents across an arrangement of distinct shards (containers)
- In a multi-node cluster, distributing the documents to shards that resides across all of the nodes
- Balancing shards across all nodes in a cluster to evenly manage the indexing and search load
- With replication, duplicating each shard to provide data redundancy and failover
- Routing requests from any node in the cluster to specific nodes containing the specific data that you need
- Seamlessly adding and integrating new nodes as you find the need to increase the size of your cluster
- Redistributing shards to automatically recover from the loss of a node
- Can be used with ELK Stack: Elasticsearch, Logstash, and Kibana

Reasons not to choose Elasticsearch:

- None

**Cloudfoundry** can deploy to run your apps on your own computing infrastructure, or deploy on an IaaS like AWS, vSphere, or OpenStack.

Reasons to choose Cloudfoundry:

- Interesting to create web application for mobile who consume back-end data
- A suitable environment to run an application.
- Application life cycle management.
- Self-healing capacity.
- Centralized management of applications.
- Distributed environment.
- Easy integration.
- Easy maintenance (upgrades etc).
- You can build.

Cloud Foundry is optimized to deliver

- Fast application development and deployment.
- Highly scalable and available architecture.
- DevOps-friendly workflows.
- Reduced chance of human error.
- Multi-tenant compute efficiencies.
- certified providers like:
    Atos Canopy,CenturyLink App Fog,GE Predix,HPE Helion Stackato 4.0,Huawei FusionStage,
    IBM Bluemix,Pivotal Cloud Foundry,SAP HANA Cloud Platform,Swisscom Application Cloud
    
**Language**

Reasons to choose Php:

- Php is a very popular language that has gained maturity for 23 years with strong community.
- Many frameworks such as Zend frameworks and Symfony frameworks have greatly improved the quality by their respective contributions.
- Php is also industrializable.
- Adapted for rapid and agile development.
- Can create great api back-end for nodejs and front-end, mobile app.

Reasons to choose Python:

- Python is a robust language that has the characteristic of setting up a solution requiring a great work force that php notably on the exploitation of thread.
- Widespread in the scientific community, it has many components ready to use.
- Python: A Dynamic Programming Language.
- Php is a very popular language that has gained maturity and stability for 28 years.
- Python is an High performance computing solution.
- Great solution for System Administrators and can be paired with all with php.
- Adapted for rapid and agile development.

Reasons to choose Nodejs:

- Fast.
- Nodejs has many tools like grunt, npm, sass.
- Used for frontend solution operation.
- Real-time solutions applications: Socket.io
- Used with web, mobile and IoT apps.
- Node offers speed and a nonblocking I/O API.
- Event-based.
- Adapted for rapid and agile development.
- Streaming data: Node can read/write streams to websockets just as well as it can read/write streams to HTTP.
- The single-threaded event-driven system can handle lots of requests at once.
- High traffic, Scalable applications
- Mobile apps that have to talk to platform API & database, without having to do a lot of data analytics.
- Build out networked applications
- Applications that need to talk to the back end very often

****

### Components



### Installation Folder Summary

### Processes

### Repository access

### Troubleshooting

See the README for more information.

### Init scripts of the services

### DevStack specific config files

### Maintenance Tasks
