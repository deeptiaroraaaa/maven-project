FROM maven:3.9.9-eclipse-temurin-8
WORKDIR /project
COPY . .
RUN mvn clean package
CMD ["java","-jar","target/maven-project-1.0-SNAPSHOT.jar" ]
