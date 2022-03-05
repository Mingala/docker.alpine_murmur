# base version targeted
ARG version_base=3.15
# Alpine base
FROM alpine:$version_base
LABEL maintainer="admin@qi2.info"

# app version targeted
ENV version_app=1.4.230
# Alpine setup
# install latest Murmur Alpine package
RUN apk add --no-cache murmur~${version_app}

# Docker image setup
# ports
EXPOSE 64738/tcp 64738/udp

# run Murmur as user murmur
# init file (bind mount file) /etc/murmur.ini
# database, crts (according to ini file, bind mount files) /var/lib/murmur/
# log (according to ini file, bind mount file) /var/log/murmur/
USER murmur
ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-v"]
CMD ["-ini", "/etc/murmur.ini"]
