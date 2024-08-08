data_path=data
backups_path=backups
current_date=$(date '+%Y-%m-%d-%H-%M-%S')

if [ ! -d backups ]; then
    mkdir $backups_path
fi

backup_file=$backups_path/data-$current_date.bak

cp -r data $backup_file

echo "Created backup : $backup_file"
