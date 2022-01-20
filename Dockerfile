FROM openjdk:17-ea-jdk-oracle

RUN mkdir /opt/minecraft
RUN mkdir /opt/minecraft/server
RUN mkdir /opt/minecraft/data

WORKDIR /opt/minecraft/server

COPY ./resources/server.jar ./server.jar

WORKDIR /opt/minecraft/data

CMD java -Xmx1024M -Xms1024M -jar ../server/server.jar nogui