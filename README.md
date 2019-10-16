# Docker for BEASTv1.10.4

* Ubuntu 18.04
* Cuda 10.1
* beagle

# Requirements

* Supply AWS credentials in a file named `credentials.txt`. Ensure that the user has write access to AWS S3. This file must be of the format,

```
AWS API key
AWS secret
Region
Format
```

Example,

```
123456
abcde
us-east-1
json
```

* Keep the xml file and cron-s3-sync in the same folder before running `docker run`.

## Running on AWS

```
docker run -it --gpus all beast/nvidia-cuda beast -beagle_info
```
