FROM python:3-alpine
MAINTAINER Laurent Corbes <caf@glot.net>

# install ssh client binary needed by some commands
RUN apk --no-cache add openssh-client

ENV GANDICLIVER 1.0

# Upgrade pip from base image
RUN pip install --upgrade pip

# install gandi cli
RUN pip install gandi.cli==$GANDICLIVER

WORKDIR /root/
ADD profile .profile

VOLUME ["/root/.config/gandi"]

#ENTRYPOINT ["/usr/local/bin/gandi"]
CMD ["/bin/sh", "--login"]
