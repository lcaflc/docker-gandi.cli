FROM python:3-alpine
MAINTAINER Laurent Corbes <caf@glot.net>

ENV GANDICLIVER latest

# install base tools
RUN apk --no-cache add \
      bash \
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
ADD bashrc /root/.bashrc

VOLUME ["/root/.config/gandi"]

#ENTRYPOINT ["/usr/local/bin/gandi"]
CMD ["/bin/bash"]
