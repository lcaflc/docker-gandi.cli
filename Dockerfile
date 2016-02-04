FROM python:3-alpine
MAINTAINER Laurent Corbes <caf@glot.net>

ENV GANDICLIVER latest

# install base tools
RUN apk --no-cache add \
      git \
      gcc libc-dev \
      yaml-dev


# install gandi cli
RUN BUILD=`mktemp -d` \
  && git clone --depth 1 https://github.com/Gandi/gandi.cli.git $BUILD \
  && cd $BUILD \
  && python setup.py install \
  && rm -rf $BUILD

WORKDIR /root/
ADD profile .profile

VOLUME ["/root/.config/gandi"]

#ENTRYPOINT ["/usr/local/bin/gandi"]
CMD ["/bin/sh", "--login"]
