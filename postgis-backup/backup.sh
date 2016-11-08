#!/bin/bash

source /secrets/aws.env
source /secrets/postgis.env

# Specify databases to back up here
for DATABASE in "sherpa"
do
    echo "$(date): Backing up database ${DATABASE}..."
    FILENAME=${DATABASE}-$(date "+%Y%m%d").xz
    pg_dump -h postgres -Fc ${DATABASE} | xz --compress > ${FILENAME}
    aws s3 mv ${FILENAME} s3://turistforeningen/backups/postgis/
done
