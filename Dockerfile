FROM centos

MAINTAINER sreedhak1243@gmail.com

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y update

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat


# COPY apache-tomcat-8.5.82 /opt/tomcat/

RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz

RUN yum -y install tar

RUN tar zxvf apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /opt/tomcat/.

RUN yum -y install java

RUN java -version

WORKDIR /opt/tomcat/webapps

RUN curl -O -L https://github.com/middleware2devops/Docker/raw/main/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]