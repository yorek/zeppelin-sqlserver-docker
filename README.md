# Apache Zeppelin for SQL Server Docker Image
This is the dockerized Apache Zeppelin with SQL Server and SQL Azure support, for which the source code is available here:

https://github.com/yorek/zeppelin

This docker image is built using the "branch-0.7" branch, which contains the latest v 0.7 *development* version.

## Version

Dockerfile version: 1.2

## Usage

After having installed your docker environment you can get the image using the docker command (via docker shell if using Docker Machine or PowerShell if using native Docker)

    docker pull yorek/zeppelin-sqlserver:branch-0.7

once the image is downloaded you can run it using the docker command

    docker run --name zeppelin -p 8080:8080 -v /zeppelin-sqlserver/notebook -v /zeppelin-sqlserver/conf -d yorek/zeppelin-sqlserver:branch-0.7

after that you can just connect to

    http://localhost:8080

using your browser to start to use Apache Zeppelin. If you are using the "old" [docker-machine](https://docs.docker.com/toolbox/overview/) instead of using the native docker engine for your OS, you need to connect to the docker machine ip address instead of localhost. If you don't know such ip address you can get it using the following command

    docker-machine ip

you can then point your browser to

    http://<docker-machine ip>:8080

and you're done. If this is your first time using Apache Zeppelin, you have to configure it to access to your SQL Server or SQL Azure instance. Read how to do so here:

 - [Using Zeppelin](https://github.com/yorek/zeppelin#using-zeppelin)

## Update an existing Docker Image

Get updated image

	docker pull yorek/zeppelin-sqlserver:branch-0.7

Once it's downloaded, check if you have a running container

	docker ps

If you see an Apache Zeppelin container is running (it is named zeppelin if you followed my tutorials), stop it
	
	docker stop zeppelin

Now create a new container pointing to the volumes of the previous version. The new container will automatically use the updated image

	docker run -name zeppelin2 -p 8080:8080 -volumes-from zeppelin -d yorek/zeppelin-sqlserver:branch-0.7

List again all the existing containers (running and not running)

	docker ps -a

Note that the old zeppelin container the is still there and if not needed can be removed

	docker rm zeppelin

The new container can now be renamed to the usual name

	docker rename zeppelin2 zeppelin

The old image can also be removed to free disk space, for example
	
	docker rmi yorek/zeppelin-sqlserver:v0.6.2

Now check that only one zeppelin container, with the latest version, is available:

	docker ps

Upgrade done! Now you can start Apache Zeppelin for SQL Server with the usual command:

	docker start zeppelin

## Notes

From version 1.1 of Dockerfile, Zeppelin notebooks and configuration are saved in Docker Volumes so that created notebooks and configured interpreters will be preserved even when the Apache Zeppelin for SQL Server image is updated.