#FROM maven:3.8-openjdk-17 AS build
#ARG JAR_FILE=target/*.jar
#COPY src /docker-studentapp/src
#COPY pom.xml /docker-studentapp
#RUN mvn -f /docker-studentapp/pom.xml clean package
#RUN mvn -f /docker-studentapp/pom.xml install package
#############################################
FROM maven:3.8-openjdk-17 AS build
COPY src /docker-studentapp/src
COPY pom.xml /docker-studentapp
#COPY /target/Docker-StudentApp-0.0.1-SNAPSHOT.jar /docker-studentapp/Docker-StudentApp.jar
COPY . /docker-studentapp
#COPY ./target/docker-demo-0.0.1-SNAPSHOT.jar /docker-demo/docker-demo-0.0.1-SNAPSHOT.jar

EXPOSE 8080
#COPY --from=build /docker-studentapp/target/Docker-StudentApp-0.0.1-SNAPSHOT.jar /docker-studentapp/Docker-StudentApp.jar
ENTRYPOINT ["java","-jar","/docker-studentapp/Docker-StudentApp.jar"]


#FROM openjdk:17-alpine


#EXPOSE 9090
#COPY --from=build /student/target/Student-0.0.1-SNAPSHOT.jar /student/Student.jar
#COPY /target/Student-0.0.1-SNAPSHOT.jar /student/Student.jar


#FROM openjdk:18-alpine
#EXPOSE 8080
#COPY --from=build /docker-studentapp/target/Docker-StudentApp-0.0.1-SNAPSHOT.jar /docker-studentapp/Docker-StudentApp-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java","-jar","/docker-studentapp/Docker-StudentApp-0.0.1-SNAPSHOT.jar"]






