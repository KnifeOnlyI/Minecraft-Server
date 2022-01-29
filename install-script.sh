if [[ -d /tmp/minecraft ]]; then
    mv /tmp/minecraft/* /opt/minecraft/
    rm -r /tmp/minecraft
fi

sh /opt/minecraft/run.sh --nogui