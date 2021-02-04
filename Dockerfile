FROM openjdk:8
MAINTAINER G Murali Krishna Reddy
RUN apt install curl
ADD target/*.jar petclinic.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=mysql", "petclinic.jar", ">", "--server.port=8089", "/var/log/petclinic.log", "2>&1"]
EXPOSE 8089
VOLUME /tmp
HEALTHCHECK --interval=5m --timeout=3s --retries=3 \
      CMD curl -f http://localhost:8089 || exit
