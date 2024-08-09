# Minecraft server

## Commands

Start server : 

```bash
# Start container in background
docker compose up -d
```

Show server logs :

```bash
docker log -f minecraft
```

Restart server :

```bash
docker compose restart
```

Stop server :

```bash
docker compose stop
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