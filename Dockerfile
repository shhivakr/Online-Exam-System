FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:17-jre

WORKDIR /app

RUN mkdir -p /var/data/uploads

COPY --from=build /app/target/online-exam-0.0.1-SNAPSHOT.jar app.jar

ENV PORT=7890
EXPOSE 7890

ENTRYPOINT ["java", "-jar", "app.jar"]
