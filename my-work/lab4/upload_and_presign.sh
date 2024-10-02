#!/bin/bash

BUCKET_NAME="ds2022-kew6jk"
FILE_URL="https://s3.amazonaws.com/ds2022-kew6jk/python_logo.png"
OBJECT_KEY="python_logo.png"

curl "$FILE_URL"

aws s3 cp "$OBJECT_KEY" "s3://$BUCKET_NAME/$OBJECT_KEY"

PRESIGNED_URL=$(aws s3 presign "s3://$BUCKET_NAME/$OBJECT_KEY" --expires-in 604800)

echo "Presigned URL: $PRESIGNED_URL" 

Presigned URL: https://ds2022-kew6jk.s3.us-east-1.amazonaws.com/python_logo.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA6K5V75LE7NMHYOG7%2F20241002%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241002T170923Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=cf657fa78b0ffbbe5a7c1db9c97fe49811f591c1c57aef6a7e94144561fb6530