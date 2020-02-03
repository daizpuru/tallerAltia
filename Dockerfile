FROM openjdk:8

# Presuponemos que en el Pipeline se habrá construido el jar
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Ejecución de la aplicación
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar","/app.jar"]


