---
date: 2020-01-27T17:00:32
title: AWS Xray brain dump
categories:
- cheatsheet
- aws
---

These are very rough notes on how I got AWS Xray working in a kubernetes deployment.
Posting this mainly for my auxiliary brain.

First, set up an IAM role that allows nodes to access xray.

Following this blog post:
https://aws.amazon.com/blogs/compute/application-tracing-on-kubernetes-with-aws-x-ray/

I cloned this repo:
https://github.com/aws-samples/aws-xray-kubernetes

Build the AWS Xray image:
```
cd xray-daemon/
docker build -t xray-daemon:latest .
```

THIS OUT OF DATE! try this: https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon-ecs.html#xray-daemon-ecs-image

Create an AWS ECR repo:
```
aws ecr create-repository --repository-name xray-daemon
```

Login via docker:
```
aws ecr get-login --no-include-email
```
That command spits out a command which you can run that will log you into docker ^

Tag and push the image there:
```
docker tag xray-daemon:latest AWS-ACCOUNT-ID.dkr.ecr.us-east-1.amazonaws.com/xray-daemon:latest
docker push AWS-ACCOUNT-ID.dkr.ecr.us-east-1.amazonaws.com/xray-daemon:latest
```
You should now be able to see the image in the AWS ECR console

Update `aws-xray-kubernetes/xray-daemon/xray-k8s-daemonset.yaml`:

Change the image value to the image you just pushed

deploy it:
```
kubectl apply -f xray-k8s-daemonset.yaml
```
