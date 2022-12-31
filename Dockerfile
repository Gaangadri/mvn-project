FROM tomcat:8.0.20-jre8

COPY target/mvn-project*.war /usr/local/tomcat/webapps/mvn-project.war
