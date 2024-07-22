# Building and Running the application in dev
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
- The backend application will be ran on localhost:8080 - [Here](localhost:8080)
