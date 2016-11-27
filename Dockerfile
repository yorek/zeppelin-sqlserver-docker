#
# Apache Zeppelin for SQL Server
# Version 0.6.2
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

RUN git clone -b v0.6.2 https://github.com/yorek/zeppelin.git zeppelin-sqlserver

WORKDIR zeppelin-sqlserver

ENV MAVEN_OPTS="-Xmx2g"

RUN mvn clean package -DskipTests

RUN cp ./conf/zeppelin-site.xml.template ./conf/zeppelin-site.xml && \
	cp ./conf/zeppelin-env.sh.template ./conf/zeppelin-env.sh

EXPOSE 8080

CMD ./bin/zeppelin.sh start
