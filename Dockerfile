FROM adoptopenjdk/openjdk11:jdk-11.0.1.13-alpine-slim
COPY build/distributions/http4k-todo-backend-1.0-SNAPSHOT.zip todobackend.zip
RUN unzip todobackend.zip
EXPOSE 8000
CMD http4k-todo-backend-1.0-SNAPSHOT/bin/http4k-todo-backend
