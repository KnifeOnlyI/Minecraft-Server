if [ ! $SERVER_INITIAL_MEMORY ]; then
    echo "ERROR: No existing 'SERVER_INITIAL_MEMORY' environment variable."
    return
fi

if [ ! $SERVER_MAX_MEMORY ]; then
    echo "ERROR: No existing 'SERVER_MAX_MEMORY' environment variable."
    return
fi

minecraft_server_eula_file=eula.txt

if [ ! -f $minecraft_server_eula_file ]; then
    echo "eula=true" > $minecraft_server_eula_file
fi

if [ ! -f $MINECRAFT_SERVER_FILENAME ]; then
    cp $MINECRAFT_SERVER_TMP_PATH/$MINECRAFT_SERVER_FILENAME $MINECRAFT_SERVER_FILENAME
fi

java -Xms$SERVER_INITIAL_MEMORY -Xmx$SERVER_MAX_MEMORY -jar $MINECRAFT_SERVER_FILENAME nogui