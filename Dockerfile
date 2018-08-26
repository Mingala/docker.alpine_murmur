# base version targeted
ARG version_base=3.8
# Alpine base
FROM alpine:$version_base
LABEL maintainer="admin@qi2.info"

# app version targeted
ENV version_app=1.2.19
# Alpine setup
# install latest Murmur Alpine package
RUN apk add --update-cache murmur~${version_app}

# Docker image setup
# ports
EXPOSE 64738/tcp 64738/udp

# run Murmur
# init file (bind mount file) /etc/murmur.ini
# database (bind mount folder) /var/lib/murmur/murmur.sqlite
# crts (according to ini file, bind mount folder) /var/lib/murmur/
USER murmur
ENTRYPOINT ["/usr/bin/murmurd", "-ini", "/etc/murmur.ini"]
