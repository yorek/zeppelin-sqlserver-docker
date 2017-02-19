#
# Apache Zeppelin for SQL Server Version 0.7
# Dockerfile v 1.1
#

FROM ubuntu:16.04

MAINTAINER Davide Mauri <info@davidemauri.it>

RUN apt-get update && apt-get install -y \
	git \
	curl \
	openjdk-8-jdk \
	nodejs \
	npm \
	libfontconfig \
	maven

RUN git clone -b v0.7 https://github.com/yorek/zeppelin.git zeppelin-sqlserver

WORKDIR zeppelin-sqlserver

ENV MAVEN_OPTS="-Xmx2g"

RUN mvn clean package -DskipTests

#
# Fix for having syntax highlighting for SQL Server
# even if supported only from version 1.2.x of Ace Editor 
# and Apache Zeppeling is still using 1.1.9
#
RUN cp sqlserver/patch/ace-builds/src-noconflict/*sqlserver* zeppelin-web/bower_components/ace-builds/src-noconflict/

RUN mvn package -DskipTests
#

RUN cp ./conf/zeppelin-site.xml.template ./conf/zeppelin-site.xml && \
	cp ./conf/zeppelin-env.sh.template ./conf/zeppelin-env.sh

VOLUME ["/zeppelin-sqlserver/notebook", "/zeppelin-sqlserver/conf"]

EXPOSE 8080

CMD ./bin/zeppelin.sh start
