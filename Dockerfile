FROM openjdk:alpine

VOLUME /tmp
ARG JAR_FILE
ADD target/${JAR_FILE} /pc.jar

ENTRYPOINT ["java","-jar","/pc.jar"]