#
# Apache Zeppelin for SQL Server
# Version 0.5.6
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

RUN git clone https://github.com/yorek/zeppelin.git zeppelin-sqlserver

RUN curl -L "https://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_6.0.7130.100_enu.tar.gz" | tar xz

RUN mvn install:install-file -Dfile=sqljdbc_6.0/enu/sqljdbc41.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc41 -Dversion=4.1  -Dpackaging=jar -DgeneratePom=true

WORKDIR zeppelin-sqlserver

ENV MAVEN_OPTS="-Xmx2g"

RUN mvn clean package -DskipTests

RUN cp ./conf/zeppelin-site.xml.template ./conf/zeppelin-site.xml && \
	cp ./conf/zeppelin-env.sh.template ./conf/zeppelin-env.sh

EXPOSE 8080

CMD ./bin/zeppelin.sh start
