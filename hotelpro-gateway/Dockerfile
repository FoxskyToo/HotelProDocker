# Etapa 1: compilar el Gateway
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

COPY src/ src/

RUN ./mvnw clean package -DskipTests

# Etapa 2: ejecutar el Gateway
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/hotelpro-gateway-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8091

ENTRYPOINT ["java", "-jar", "app.jar"]