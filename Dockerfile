FROM amazoncorretto:21-alpine3.20

RUN mkdir /opt/minecraft
RUN mkdir /opt/minecraft/data
RUN mkdir /opt/minecraft/server

RUN apk add wget git

ARG MINECRAFT_VERSION
ARG MINECRAFT_MEMORY

ENV MINECRAFT_VERSION=${MINECRAFT_VERSION}
ENV MINECRAFT_MEMORY=${MINECRAFT_MEMORY}

COPY ./entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["sh", "/opt/entrypoint.sh"]
