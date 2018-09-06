FROM tomcat_7.0.77:latest
MAINTAINER anandgupta01@gmail.com
COPY gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run" ]
