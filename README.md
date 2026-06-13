# Starter Simple Java

A simple full-stack template featuring **Angular** for the frontend and **Java Spring Boot** for the backend.

## Project Structure

- `backend/`: Spring Boot application.
- `frontend/`: Angular application.
- `pom.xml`: Root Maven descriptor managing both modules.
- `Dockerfile`: Multi-stage build for the entire application.

## Prerequisites

- Java 25
- Maven 3.9+
- Node.js & pnpm (managed by Maven during build)

## Getting Started

### Local Development

1. **Run the Backend:**
   ```bash
   cd backend
   mvn spring-boot:run
   ```

2. **Run the Frontend:**
   ```bash
   cd frontend
   pnpm install
   pnpm start
   ```

### Build & Package

To build the entire project (frontend + backend) and package it into a single executable JAR:

```bash
mvn clean package
```

The resulting JAR will be located in `backend/target/`.

### Run with Docker

You can build and run the application using Docker:

```bash
docker build -t starter-simple-java .
docker run -p 8080:8080 starter-simple-java
```

The application will be available at `http://localhost:8080`.

## Features

- **Single Command Build**: Build both frontend and backend with a single `mvn clean package`.
- **SPA Support**: Integrated `SpaController` in Spring Boot to handle Angular routing.
- **Dockerized**: Ready to be deployed as a container.
