#!/bin/bash

import requests
import boto3
from botocore.exceptions import NoCredentialsError

bucket_name = 'ds2022-kew6jk'
url = 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Rotating_earth_animated_transparent.gif?20201022124448'
object_name = 'earth_rotating.gif'
expires_in = 604800

def fetch_file(url, object_name):
    response = requests.get(url)
    if response.status_code == 200:
        with open(object_name, 'wb') as f:
            f.write(response.content)
        print(f"File saved as {object_name}")
    else:
        print(f"Failed to fetch file: {response.status_code}")

def upload_to_s3(object_name, bucket_name, object_name):
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(object_name, bucket_name, object_name)
        print(f"Uploaded {object_name} to {bucket_name}/{object_name}")
    except NoCredentialsError:
        print("Credentials not available")

def generate_presigned_url(bucket_name, object_name):
    url = s3.generate_presigned_url(
        'get_object',
        Params={'Bucket': bucket_name, 'Key': object_name},
        ExpiresIn=expires_in
)
    print(url)

Presigned URL: https://ds2022-kew6jk.s3.us-east-1.amazonaws.com/earth_rotating.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA6K5V75LE7NMHYOG7%2F20241002%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241002T170923Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=cf657fa78b0ffbbe5a7c1db9c97fe49811f591c1c57aef6a7e94144561fb6530
