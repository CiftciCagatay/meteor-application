FROM ubuntu

USER root

# For tzdata dependency asking TZ while build
ENV DEBIAN_FRONTEND=noninteractive

# Install OS dependencies
RUN apt-get update && \
    apt-get install --assume-yes apt-transport-https ca-certificates && \
    apt-get install --assume-yes --no-install-recommends build-essential bzip2 curl git libarchive-tools python

# Install NodeJS 12.x
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install meteor
RUN curl https://install.meteor.com/ | sh

