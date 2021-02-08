FROM openjdk:8
MAINTAINER G Murali Krishna Reddy
RUN apt install curl
RUN touch petclinic.log
ADD target/*.jar petclinic.jar
CMD ["java", "-jar", "petclinic.jar --server.port=8089 >> petclinic.log 2>&1"]
EXPOSE 8089
VOLUME /tmp
HEALTHCHECK --interval=5m --timeout=3s --retries=3 \
      CMD curl -f http://localhost:8089 || exit
