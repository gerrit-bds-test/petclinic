FROM openjdk:8
MAINTAINER G Murali Krishna Reddy
RUN apt install curl
ADD target/*.jar petclinic.jar
ENTRYPOINT ["java", "-jar", "petclinic.jar"]
EXPOSE 8080
VOLUME /tmp
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
