#!/bin/bash

VERSION=$1
ORG=jenkinsxio
APP_NAME=jenkinsx

jx step create pr chart --name $ORG/$APP_NAME --version ${VERSION} --repo https://github.com/jenkins-x/jenkins-x-platform.git
jx step create pr docker --name $ORG/$APP_NAME --version ${VERSION} --repo https://github.com/jenkins-x/jenkins-x-platform.git
jx step create pr regex --regex "^(?m)\s+Image: \"gcr.io\/jenkinsxio\/jenkinsx\"\s+ImageTag: \"(.*)\"$" --version ${VERSION} --files jenkins-x-platform/values.yaml --repo https://github.com/jenkins-x/jenkins-x-platform.git
