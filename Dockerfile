FROM gradle:7.5.1-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM eclipse-temurin:11-jdk-jammy as run
EXPOSE 8000
RUN mkdir /app
COPY --from=build /home/gradle/src/build/distributions/http4k-todo-backend-1.0-SNAPSHOT /app/
ENTRYPOINT /app/bin/http4k-todo-backend