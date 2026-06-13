# Build stage
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /app

# Copy source code
COPY . .

# Build the project
# The frontend-maven-plugin will download Node and pnpm automatically.
# Using a Debian-based build image (standard for Maven) avoids compatibility issues
# encountered on Alpine with pre-compiled Node.js binaries.
RUN mvn clean package -DskipTests

# Final stage (Runtime)
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Copy the generated JAR from the build stage
COPY --from=build /app/backend/target/*.jar app.jar

# Expose the port
EXPOSE 8080

# Run command
ENTRYPOINT ["java", "-jar", "app.jar"]
