FROM tomcat:8.0.21-jre8

MAINTAINER anandgupta01@gmail.com

COPY ./target/gameoflife.war /usr/local/tomcat/webapps/
