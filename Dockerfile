FROM ubuntu:latest
RUN apt update
RUN apt install openjdk-21-jre-headless bash -y
RUN mkdir /server /minecraft
RUN adduser --system --shell /bin/bash --group minecraft
COPY /build/server.jar /server
RUN chown -R minecraft:minecraft /server
RUN chown -R minecraft:minecraft /minecraft
USER minecraft
WORKDIR /minecraft
CMD ["java", "-Xms2G", "-Xmx8G", "-XX:+UseG1GC", "-jar", "/server/server.jar", "--nogui"]