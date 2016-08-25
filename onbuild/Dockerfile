FROM debian:wheezy
MAINTAINER Andrew Wharton <andrew@deciduouspress.com.au>

ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR

RUN bash $METEORD_DIR/init.sh

EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh

ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/on_build.sh