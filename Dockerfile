FROM centos:7
RUN yum install epel-release -y 
RUN yum install java-openjdk -y 
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz /opt
WORKDIR /opt
RUN tar -xzf apache-tomcat-9.0.78.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-9.0.78
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war webapps/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar lib/
COPY context.xml conf/context.xml
EXPOSE 8080 
CMD ./bin/catalina.sh run 