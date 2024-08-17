# Minecraft server

## Getting started

1. Create `./env` file that contains required environment variables (see "Environment Variables" section for more informations)
2. Create a folder which contains the minecraft server data. It is required to allow mounted volumes as current user and not root user.
3. Build image `docker compose build`
4. Run container (run minecraft server) `docker compose up -d && docker logs -f minecraft`

All minecraft server data will be available in the folder specified in the `./env` file.

## Commands

```bash
# Start container in background
docker compose up -d
```

Show server logs :

```bash
docker logs -f minecraft
```

To restart container (restart minecraft server) : 

```bash
docker compose restart
```

To stop container (stop minecraft server)

```bash
docker compose stop
```

## Environment Variables

- USER_ID (required for run only)
- GROUP_ID (required for run only)
- MINECRAFT_SERVER_VERSION (required for build and run)
- MINECRAFT_SERVER_PORT (required for run only)
- MINECRAFT_SERVER_RCON_PORT (required for run only)
- MINECRAFT_SERVER_INITIAL_MEMORY (required for run only)
- MINECRAFT_SERVER_MAX_MEMORY (required for run only)
- MINECRAFT_SERVER_DATA_FOLDER (required for run only)

### Example

```env
# The ID of host user that handle minecraft server data 
USER_ID=1000 

# The ID of host group that handle minecraft server data
GROUP_ID=1000 

# Standard port
MINECRAFT_SERVER_PORT=25565 

# Standard RCON port
MINECRAFT_SERVER_RCON_PORT=25575 

MINECRAFT_SERVER_VERSION=1.21.1

MINECRAFT_SERVER_INITIAL_MEMORY=512M

MINECRAFT_SERVER_MAX_MEMORY=2048M

# The folder must contains minecraft server data to mount on the container 
MINECRAFT_SERVER_DATA_FOLDER=./data 
```