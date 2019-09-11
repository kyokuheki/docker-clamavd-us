FROM alpine
LABEL maintainer Kenzo Okuda <kyokuheki@gmail.com>

RUN apk add --no-cache clamav clamav-daemon clamav-libunrar freshclam

COPY *.conf /etc/clamav/
COPY entrypoint.sh /

VOLUME ["/var/lib/clamav"]
EXPOSE 3310
ENTRYPOINT ["/entrypoint.sh"]
