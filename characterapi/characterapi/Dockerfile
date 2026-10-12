
# build the application
FROM eclipse-temurin:25-jdk-alpine AS build

WORKDIR /app

# copy the project files
COPY . .

# ensure the Maven wrapper can execute
RUN chmod +x mvnw

# build the application JAR
RUN ./mvnw -B -DskipTests package

# run the application
FROM eclipse-temurin:25-jre-alpine

WORKDIR /app

# copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# start spring boot
ENTRYPOINT ["java", "-jar", "app.jar"]
