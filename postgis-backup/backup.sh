#!/bin/bash

source /secrets/aws.env
source /secrets/postgis.env

for DATABASE in ${DATABASES//,/ }
do
    FILENAME=${DATABASE}-$(date "+%Y%m%d").xz
    pg_dump -h postgres -Fc ${DATABASE} | xz --compress > ${FILENAME}
    aws s3 mv ${FILENAME} s3://turistforeningen/backups/postgis/
done
