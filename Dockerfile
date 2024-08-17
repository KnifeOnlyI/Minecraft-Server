FROM amazoncorretto:21-alpine3.20

ARG MINECRAFT_SERVER_VERSION

ENV MINECRAFT_SERVER_FILENAME=spigot-$MINECRAFT_SERVER_VERSION.jar
ENV MINECRAFT_SERVER_TMP_PATH=/tmp/minecraft
ENV MINECRAFT_SERVER_DATA_PATH=/opt/minecraft/data

RUN apk add wget git

RUN mkdir -p $MINECRAFT_SERVER_DATA_PATH

COPY ./entrypoint.sh /opt/entrypoint.sh

RUN mkdir $MINECRAFT_SERVER_TMP_PATH
WORKDIR $MINECRAFT_SERVER_TMP_PATH

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev $MINECRAFT_SERVER_VERSION --final-name $MINECRAFT_SERVER_FILENAME

WORKDIR $MINECRAFT_SERVER_DATA_PATH

ENTRYPOINT ["sh", "/opt/entrypoint.sh"]
