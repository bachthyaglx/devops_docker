FROM amazoncorretto:8

WORKDIR /usr/src/app

COPY target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
