FROM openjdk:8
MAINTAINER G Murali Krishna Reddy
RUN apt install curl
ADD target/*.jar petclinic.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=mysql", "petclinic.jar"]
EXPOSE 8080
VOLUME /tmp
HEALTHCHECK --interval=5m --timeout=3s --retries=3 \
      CMD curl -f http://localhost:8080 || exit
