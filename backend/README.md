# Running backend in development
- Run `mvn clean install` once, run again if you change the pom.xml file
- Run `mvn spring-boot:run` to start the code, the server will auto-update when code changes

# Building and Running the application (Don't do this for now, we'll use in prod)
This project utilizes Docker to package and run the application. Here's how to get started:
- Prerequisites:
  - Download Docker on your host computer: [Download here](https://www.docker.com/products/docker-desktop/)
 
Start the Docker desktop application and ensure it is running.

## Building - Only do this once!!
- Build the image in terminal in the project directory:
  - Navigate to backend/ directory where the Dockerfile is
  - Run `docker build -t pitch-backend-image .` in the terminal

## Running the application via Docker
- Run `docker run --rm -p 8080:8080 pitch-backend-image`
- The backend application will be ran on localhost:8080 - [Here](http://localhost:8080)