FROM tomcat_7.0.77:latest
MAINTAINER anandgupta01@gmail.com
COPY /var/jenkins_home/workspace/Build_Pipeline/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run" ]
