# Backup MongoDB to Google Cloud Storage

A script to create encrypted acrhive backups of a mongodb database to Google Cloud Storage Bucket.

### Environment Variables

| Name                | Description                      |
| ------------------- | -------------------------------- |
| BACKUP_NAME         | Backup File Prefix               |
| MONGO_URI           | MongoDB URI                      |
| ENCRYPTION_PASSWORD | Password to decrypt the backup   |
| GCS_BUCKET          | Google Cloud Storage bucket name |
