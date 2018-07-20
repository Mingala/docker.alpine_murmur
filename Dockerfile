FROM alpine:3.8
LABEL maintainer="admin@qi2.info"

# Alpine setup
# install latest Murmur Alpine package
RUN apk add --update-cache murmur

# Docker image setup
# ports
EXPOSE 64738/tcp 64738/udp

# run Murmur
# init file (to map) /etc/murmur.ini
# database (to map) /var/lib/murmur/murmur.sqlite
VOLUME ["/var/lib/murmur"]
USER murmur
ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-v"]
CMD ["-ini", "/etc/murmur.ini"]
