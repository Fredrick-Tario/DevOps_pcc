# Load config.env
source "./config.env"

# Source path 
TARGET="${1:-}"

# Create date and time
DATE="$(date +%Y-%m-%d_%H-%M-%S)"
BACKUP_NAME="backup_${DATE}.tar.gz"

# Path where the backup will be saved
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"

# Create the compressed backup
tar -czf "$BACKUP_PATH" -C ".." "app_source"; 

# Validate whether the archive can be read
if tar -tzf "$BACKUP_PATH" > /dev/null 2>&1; then
    STATUS="SUCCESS"
else
    STATUS="FAILED"
fi

# Get the size 
BACKUP_SIZE="$(du -h "$BACKUP_PATH" | awk '{print $1}')"

# Remove backups older than 30
find "$BACKUP_DIR" \
    -type f \
    -name "backup_*.tar.gz" \
    -mtime +"$RETENTION_DAYS" \
    -delete

echo
echo "Source:"
echo "$TARGET"
echo
echo "Backup created:"
echo "$BACKUP_NAME"
echo
echo "Size: $BACKUP_SIZE"
echo "Status: $STATUS"