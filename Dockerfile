FROM python:3-alpine
MAINTAINER Laurent Corbes <caf@glot.net>

ENV GANDICLIVER latest

# install base tools and build gandi.cli
RUN apk --no-cache add \
      git \
      gcc libc-dev \
      yaml-dev \
  && BUILD=`mktemp -d` \
  && git clone --depth 1 https://github.com/Gandi/gandi.cli.git $BUILD \
  && cd $BUILD \
  && python setup.py install \
  && rm -rf $BUILD \
  && apk --purge del git gcc libc-dev yaml-dev

WORKDIR /root/
ADD profile .profile

VOLUME ["/root/.config/gandi"]

#ENTRYPOINT ["/usr/local/bin/gandi"]
CMD ["/bin/sh", "--login"]
