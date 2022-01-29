FROM openjdk:17-alpine

RUN apk add --no-cache

RUN mkdir /tmp/minecraft

WORKDIR /tmp/minecraft
RUN wget https://mohistmc.com/builds/1.18-testing/mohist-1.18.1-39.0.59-installer.jar
RUN java -jar mohist-1.18.1-39.0.59-installer.jar --installServer
RUN touch eula.txt
RUN echo "eula=true" > eula.txt

COPY ./install-script.sh /tmp/install-script.sh

WORKDIR /opt/minecraft

CMD sh /tmp/install-script.sh