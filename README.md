# Apache Zeppelin for SQL Server Docker Image
This is the dockerized Apache Zeppelin with SQL Server and SQL Azure support, for which the source code is available here:

https://github.com/yorek/incubator-zeppelin

This docker image is build using the "master" branch, which contains the branch with the latest STABLE features

## Usage

After having installed your docker environment you can get the image using the docker command (via docker shell)

    docker pull yorek/zeppelin-sqlserver

once the image is downloaded you can run it using the docker command

    docker run -p 8080:8080 --name zeppelin -d yorek/zeppelin-sqlserver

after that you can use a browser to connect to your docker machine ip address to use Zeppelin. If you don't know such ip address you can get it using the followin command

    docker-machine ip

you can then point your browser to

    http://<docker-machine ip>:8080

and you're done. If this is your first time using Apache Zeppelin, you have to configure it to access to your SQL Server or SQL Azure instance. Read how to do so here:

 - [Using Zeppelin](https://github.com/yorek/incubator-zeppelin#using-zeppelin)

## Notes

With the current version of the Dockerfile, all notebook created in the container will be destroyed when the container is stopped. You can preserve your work exporting the Apache Zeppelin notebook.

The scripts has been tested using the current Windows edition of [Docker](https://docs.docker.com/windows/): 1.11.1
