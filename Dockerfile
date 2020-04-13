FROM openjdk:8
MAINTAINER G Murali Krishna Reddy
ADD target/*.jar petclinic.jar
ENTRYPOINT ["java", "-jar", "petclinic.jar"]
EXPOSE 8080
VOLUME /tmp
