if [[ -d /tmp/minecraft ]]; then
    mv /tmp/minecraft/* /opt/minecraft/
    rm -r /tmp/minecraft
fi

java -Xms1G -Xmx2G -jar /opt/minecraft/server.jar --nogui