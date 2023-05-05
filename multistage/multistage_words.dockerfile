FROM maven:3.6.3-jdk-8-slim AS Primera
COPY pom.xml .
COPY src src
RUN mvn verify 

FROM openjdk:8-jre-slim
COPY --from=Primera ./target ./target
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "/target/words.jar"]
EXPOSE 8080
