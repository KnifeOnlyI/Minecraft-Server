minecraft_root_path=/opt/minecraft
minecraft_data_path=$minecraft_root_path/data
minecraft_server_eula_file=$minecraft_data_path/eula.txt

if [ ! $MINECRAFT_VERSION ]; then
    echo "ERROR: Not found 'MINECRAFT_VERSION' environment variable."
    return
fi

minecraft_server_jar_file=spigot-$MINECRAFT_VERSION.jar
minecraft_server_jar_filepath=$minecraft_data_path/$minecraft_server_jar_file

# If eula.txt file not found, create it and put "eula=true" inside
if [ ! -f $minecraft_server_eula_file ]; then
    echo "eula=true" > $minecraft_server_eula_file
    echo "Created '$minecraft_server_eula_file' file"
fi

# If not found server.jar that corresponding to the specified minecraft version built it from sources
if [ ! -f $minecraft_server_jar_filepath ]; then
    cd /tmp

    echo "Not found '$minecraft_server_jar_filepath' file. Get last version of Spigot BuildTools.jar to build from sources"
    rm -rf BuildTools.jar
    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    
    echo "Build $minecraft_server_jar_file file"
    java -jar BuildTools.jar --rev $MINECRAFT_VERSION
    
    mv $minecraft_server_jar_file $minecraft_server_jar_filepath
    echo "Moving '$minecraft_server_jar_file' in $minecraft_data_path"
fi

cd $minecraft_data_path

java -Xmx1024M -Xms1024M -jar $minecraft_server_jar_filepath nogui