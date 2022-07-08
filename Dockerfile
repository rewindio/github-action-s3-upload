FROM python:3.9.12-alpine

LABEL "com.github.actions.name"="S3 Sync"
LABEL "com.github.actions.description"="Upload a file to an AWS S3 bucket"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

LABEL version="0.1.0"
LABEL repository="https://github.com/rewindio/github-action-s3-upload"
LABEL homepage="https://www.rewind.io/"
LABEL maintainer="Dave North <dave.north@rewind.io>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.18.2'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
