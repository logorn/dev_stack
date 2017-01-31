ansible dev stack template
================================================================================
The project goal is to automatically deploy the configuration needed for an operational development environment.

The component are standard dev stack for front and back.

The databases as well as the indexing engine is defined on the second machine so as to limit the impacts.

The application servers are on the main machine.

The aim of such an architecture is to have a modular configuration.

It is possible to extend this base via the association of additional roles.

This project involves the use of:

Automation:

- ansible
- vagrant
- virtualbox

HTTP Server:

- nginx
- apache2

Database:

- mongodb
- mysql

Search Engine:

- elasticsearch

Paas:

- cloudfoundry

Language:

- python 2.7
- php 7.x
- php fpm
- nodejs

Framework:

- Symfony Framework 3.x

================================================================================
Why these choices

Ansible:

Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service ...
Ansible is an agentless architecture.

Vagrant:

Vagrant enables users to create and configure lightweight, reproducible, and portable development environments.
The goal is building and maintaining portable virtual development environments.

Virtualbox:

VirtualBox is a cross-platform virtualization application. VirtualBox is a free and open-source hypervisor for x86 computers.
VirtualBox allow a user to run a secondary instance of another operating system for compatibility or testing purposes.

Nginx:

Nginx is a web server, which can also be used as a reverse proxy, load balancer and HTTP cache.
Nginx doesn't rely on threads to handle requests, unlike traditional servers.

Nginx utilizes an asynchronous event-driven approach.

The modular event-driven architecture used by nginx allows for more predictability in regards to performance when the server is under heavy loads.

Apache2:

The Apache HTTP Server, colloquially called Apache is the world's most used web server software.
Originally based on the NCSA HTTPd server.

Mongodb:

MongoDB is an open source database that uses a document-oriented data model.
MongoDB offers scalability, no schema migrations.
MongoDB offers deep query-ability and supports dynamic queries on documents using a document-based query language that's nearly as powerful as SQL. 

Mysql:

MySQL is a free, open-source database management system (DBMS for short).
A DBMS is a system that manages databases and connects them to software.
For example, a MySQL database can be used to run a website, to run the database of an ERP or any other software.
MySQL is an relational database management system (RDBMS) based on Structured Query Language.

Elasticsearch:

Elasticsearch is a search engine based on Apache Lucene.
It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface.
Elasticsearch is RESTful search engine built on top of Apache Lucene.

Elasticsearch provides a scalable search solution.
Elasticsearch performs near-real-time searches.
Elasticsearch provides support for multi-tenancy.
Elasticsearch Streamlines backup processes ensures data integrity.
With elasticsearch, an index can be easily recovered in a case of a server crash.
Elasticsearch uses Javascript Object Notation (JSON) and Java application program interfaces (APIs).
Elasticsearch automatically indexes JSON documents.
Elasticsearch indexing uses unique type-level identifiers.
With elasticsearch, each index can have its own settings.
With elasticsearch, searches can be done with Lucene-based querystrings.

Cloud Foundry:

Cloud Foundry is an open source, multi cloud application platform as a service (PaaS) governed.
Cloud Foundry is a system to easily deploy, operate and scale stateless applications that are written in any programming language or framework. 
Customizable, it allows to program in several languages and under several infrastructures.
Cloud Foundry provides a REST API to deploy, operate and scale applications. 

Language:

python 2.7, php 7.x, nodejs are representative languages of web technologies with a strong community and frameworks.

PHP-FPM:

PHP-FPM is a simple and robust FastCGI Process Manager for PHP.
It can dramatically ease scaling of PHP apps and is the normal way of running PHP-based sites and apps when using a webserver like Nginx (though it can be used with other webservers just as easily).

Framework Php:

- Symfony Framework is high performance PHP framework for web development

================================================================================

pre-reqs
================================================================================

Software on host

    vagrant 1.8.5
    ansible 2.1.1.0
    python 2.7.12
    virtualbox 5.1.4r110228

supported systems

    We currently support Linux and macOS.

vagrant plugins

    sahara (0.0.17)
    vagrant-ansible-local (0.0.2)
    vagrant-env (0.0.3)
    vagrant-gatling-rsync (0.9.0)
    vagrant-guestip (0.2)
    vagrant-host-shell (0.0.4)
    vagrant-hostmanager (1.8.5)
    vagrant-hosts (2.8.0)
    vagrant-hosts-provisioner (2.0)
    vagrant-hostsupdater (1.0.2)
    vagrant-list (0.0.6)
    vagrant-multi-hostsupdater (0.0.6)
    vagrant-proxyconf (1.5.2)
    vagrant-reload (0.0.1)
    vagrant-rsync (0.2.5)
    vagrant-share (1.1.6)
    vagrant-triggers (0.5.3)
    vagrant-vbguest (0.13.0)
    vagrant-vbox-snapshot (0.0.10)

quick start
================================================================================

0. Clone repository

    git clone git@github.com:logorn/dev_stack.git deploy

1. Record and execute command

    vagrant up

2. Open url [devstack](devstack.local) from your browser. The following message should appear "Service Unavailable"

   curl [devstack](devstack.local)

3. Acces vm through the ssh connection

    vagrant ssh
    
telosys for Symfony 3
================================================================================

You can use this project associating it with telosys for symfony ansible role.

*Inside `roles` directory*:

    git clone https://github.com/logorn/ansible-role-telosys-symfony.git telosys-php

Example Playbook

*Inside `devstack.yml`, add this*:

    - hosts: devstack
      roles:
        - role: telosys-php
          tags: telosys-php
    ...

and play now your provision ...

technical incident
================================================================================

In case of problem, just start with the command on host

    vagrant provision # provisionning guest machine

To destroy virtual machine and provisionning

    vagrant destroy
    vagrant up
    
thanks and credits to:
================================================================================

Inspired by:

Jeff Geerling (geerlingguy)

https://github.com/geerlingguy/ansible-role-php

https://github.com/geerlingguy/ansible-role-nginx

https://github.com/geerlingguy/ansible-role-java

https://github.com/geerlingguy/ansible-role-elasticsearch

https://github.com/geerlingguy/ansible-role-php-xdebug

Ansible City

https://github.com/ansible-city/swap

locationlabs

https://github.com/locationlabs/ansible-role_kernel-update

license
================================================================================

Apache License, Version 2.0

<http://www.apache.org/licenses/LICENSE-2.0.html>

author Information
================================================================================

These roles were created in 2017 by Hugues MAILLET, inspired by Jeff Geerling author of Ansible for DevOps and the work of many.
