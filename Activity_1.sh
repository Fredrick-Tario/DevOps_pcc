Activity 1:

Objective: Create a backup automation script for dbs and application files

Requirements:
Create a folder named backup_system/ with the following contents:
backup.sh
config.env
backups/
logs/

script requirements:
1. accept backup target
2. Create compressed backup_system
3. store backup based on date
4. validate backup integrity
5. remove backups older than 30 days

Expected output

Source:
/var/www/app

Backup created:
backup_202-07-25.tar.gz

size: 500 MB
Status: SUCCESS
