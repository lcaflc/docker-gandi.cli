FROM python:3-alpine
MAINTAINER Laurent Corbes <caf@glot.net>

ENV GANDICLIVER 0.16

# Upgrade pip from base image
RUN pip install --upgrade pip


# install base tools
RUN apk --no-cache add \
      bash

# install gandi cli
RUN pip install gandi.cli==$GANDICLIVER \
# install older version of click because >6 does not work on stable release
  && pip install --force-reinstall click==5.1

WORKDIR /root/
ADD bashrc /root/.bashrc

VOLUME ["/root/.config/gandi"]

#ENTRYPOINT ["/usr/local/bin/gandi"]
CMD ["/bin/bash"]
