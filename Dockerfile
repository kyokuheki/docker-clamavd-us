FROM alpine
LABEL maintainer Kenzo Okuda <kyokuheki@gmail.com>

RUN apk add --no-cache clamav clamav-daemon clamav-libunrar freshclam runit

COPY *.conf /etc/clamav/
COPY supervisord.conf /etc/supervisord.conf

VOLUME ["/var/lib/clamav"]
EXPOSE 3310
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
