# Apache Zeppelin for SQL Server Docker Image
This is the dockerized Apache Zeppelin with SQL Server and SQL Azure support, for which the source code is available here:

https://github.com/yorek/zeppelin

This docker image is built using the "v0.7" branch

## Version

Dockerfile version: 1.1

## Docker Hub

Apache Zeppelin for SQL Server Docker image is available at the [Docker Hub](https://hub.docker.com/r/yorek/zeppelin-sqlserver/). 

## Usage

After having installed your docker environment you can get the image using the docker command (via docker shell if using Docker Machine or PowerShell if using native Docker)

    docker pull yorek/zeppelin-sqlserver

once the image is downloaded you can run it using the docker command

    docker run --name zeppelin -p 8080:8080 -v /zeppelin-sqlserver/notebook -v /zeppelin-sqlserver/conf -d yorek/zeppelin-sqlserver:latest

after that you can just connect to

    http://localhost:8080

using your browser to start to use Apache Zeppelin. If you are using the "old" [docker-machine](https://docs.docker.com/toolbox/overview/) instead of using the native docker engine for your OS, you need to connect to the docker machine ip address instead of localhost. If you don't know such ip address you can get it using the following command

    docker-machine ip

you can then point your browser to

    http://<docker-machine ip>:8080

and you're done. If this is your first time using Apache Zeppelin, you have to configure it to access to your SQL Server or SQL Azure instance. Read how to do so here:

 - [Using Zeppelin](https://github.com/yorek/zeppelin#using-zeppelin)

## Update an existing Docker Image

WIP

## Notes

From version 1.1 of Dockerfile, Zeppelin notebooks and configuration are saved in Docker Volumes so that created notebooks and configured interpreters will be preserved even when the Apache Zeppelin for SQL Server image is updated.