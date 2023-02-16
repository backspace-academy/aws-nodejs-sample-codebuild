#!/bin/bash
# Create a new tag with date and incrementing version of a git repo

# Get the current version of the repo
CURRENT_VERSION=$(git tag | sort -V | tail -n1)

# split the version into components
VERSION_NUMBERS=(${CURRENT_VERSION//./ })

# Increment the last number in the version
VERSION_NUMBERS[2]=$((${VERSION_NUMBERS[2]}+1))

# Re-create the version string
NEW_VERSION="${VERSION_NUMBERS[0]}.${VERSION_NUMBERS[1]}.${VERSION_NUMBERS[2]}"

# Get the current date
DATE=$(date +"%Y%m%d")

# Create the new tag
TAG="eemp.infra.dev$DATE.$NEW_VERSION" 

# Add and push the tag
git tag $TAG
git push origin $TAG git@github.com:nagadevops2016/aws-nodejs-sample-codebuild.git
##
