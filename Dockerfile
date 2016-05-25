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

RUN curl -L "https://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_6.0.7130.100_enu.tar.gz" | tar xz

RUN git clone https://github.com/yorek/incubator-zeppelin.git zeppelin-sqlserver

ENV MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1024m"

RUN mvn install:install-file -Dfile=sqljdbc_6.0/enu/sqljdbc41.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc41 -Dversion=4.1  -Dpackaging=jar -DgeneratePom=true

WORKDIR zeppelin-sqlserver

RUN mvn clean package -DskipTests

RUN cp ./conf/zeppelin-site.xml.template ./conf/zeppelin-site.xml

RUN cp ./conf/zeppelin-env.sh.template ./conf/zeppelin-env.sh

EXPOSE 8080

CMD ./bin/zeppelin.sh start



