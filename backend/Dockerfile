# Use the official Amazon Corretto 17 image as a base image
FROM amazoncorretto:17

# Set the working directory in the container
WORKDIR /app

# Copy the build artifact from the target directory to the container
COPY target/*.jar ./app.jar

# Expose the port the app runs on
EXPOSE 8080

# Specify the command to run on container start
ENTRYPOINT ["java", "-jar", "app.jar"]