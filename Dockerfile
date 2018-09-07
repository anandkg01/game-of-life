FROM tomcat:8.0.20-jre8
MAINTAINER anandgupta01@gmail.com
COPY gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run" ]
