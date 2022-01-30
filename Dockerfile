FROM openjdk:17-alpine

RUN mkdir /tmp/minecraft

WORKDIR /tmp/minecraft

RUN wget "https://download.getbukkit.org/spigot/spigot-1.18.1.jar" -O server.jar
RUN touch eula.txt
RUN echo "eula=true" > eula.txt

COPY ./install-script.sh /tmp/install-script.sh

WORKDIR /opt/minecraft

CMD sh /tmp/install-script.sh