# Apache Zeppelin for SQL Server Docker Image
This is the dockerized Apache Zeppelin with SQL Server and SQL Azure support, for which the source code is available here:

https://github.com/yorek/zeppelin

This docker image is built using the "v0.6.2" branch

## Usage

After having installed your docker environment you can get the image using the docker command (via docker shell if using Docker Machine or PowerShell if using native Docker)

    docker pull yorek/zeppelin-sqlserver:v0.6.2

once the image is downloaded you can run it using the docker command

    docker run -p 8080:8080 --name zeppelin -d yorek/zeppelin-sqlserver:v0.6.2

after that you can just connect to

    http://localhost:8080

using your browser to start to use Apache Zeppelin. If you are using the "old" [docker-machine](https://docs.docker.com/toolbox/overview/) instead of using the native docker engine for your OS, 
you need to connect to the docker machine ip address instead of localhost. If you don't know such ip address you can get it using the following command

    docker-machine ip

you can then point your browser to

    http://<docker-machine ip>:8080

and you're done. If this is your first time using Apache Zeppelin, you have to configure it to access to your SQL Server or SQL Azure instance. Read how to do so here:

 - [Using Zeppelin](https://github.com/yorek/zeppelin#using-zeppelin)

## Notes

With the current version of the Dockerfile, all notebook created in the container will be destroyed when the container is stopped. 
You can preserve your work exporting the Apache Zeppelin notebook or you can mount a volume when running Docker.

Create a Zeppelin folder in your user home directory (usually c:/Users/<user>) and

Using the Docker Machine 

docker run -p 8080:8080 — name zeppelin -d -v /c/Users/<user>/Zeppelin:/zeppelin-sqlserver/notebook yorek/zeppelin-sqlserver:v0.6.2

Using native Docker

docker run -p 8080:8080 — name zeppelin -d -v c:/Users/<user>/Zeppelin:/zeppelin-sqlserver/notebook yorek/zeppelin-sqlserver:v0.6.2

