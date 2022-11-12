#!/bin/bash
FILENAME=$BACKUP_NAME-$(date +%d-%m-%Y_%H-%M-%S).gz
# Create backup
mongodump --uri $MONGO_URI --gzip --archive=$FILENAME

#encrypt the backup
echo $ENCRYPTION_PASSWORD | gpg --yes --batch --passphrase-fd 0 -c $FILENAME

#remove the unencrypted backup
rm $FILENAME

#upload to gcs
gsutil cp $FILENAME.gpg gs://$GCS_BUCKET/$FILENAME.gpg

#remove the encrypted backup
rm $FILENAME.gpg
