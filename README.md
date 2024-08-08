# Minecraft server

## Commands

Start server : 

```bash
docker compose up
```

Stop server :
m
```bash
docker compose stop
```

Show server logs :

```bash
docker log -f minecraft
```

Create minecraft server data backup : 

```bash
# Don't forgot to make script executable : chmod +x create-backup.sh
sudo create-backup.sh
```

Restore minecraft server data backup : 

```bash
sudo rm -rf data
sudo cp -r backups/<backup_file> data
```