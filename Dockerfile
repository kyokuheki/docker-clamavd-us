FROM alpine
LABEL maintainer Kenzo Okuda <kyokuheki@gmail.com>

RUN apk add --no-cache clamav clamav-daemon clamav-libunrar freshclam runit

RUN mkdir -p /etc/sv/clamd /etc/sv/freshclam \
 && echo -e '#!/bin/sh\n exec 1>&2 clamd\n' > /etc/sv/clamd/run \
 && echo -e '#!/bin/sh\n exec 1>&2 freshclam -d --stdout -v -c1' > /etc/sv/freshclam/run \
 && chmod +x /etc/sv/clamd/run /etc/sv/freshclam/run

COPY *.conf /etc/clamav/
COPY entrypoint.sh /
#COPY clamd /etc/sv/clamd/run
#COPY freshclam /etc/sv/freshclam/run

VOLUME ["/var/lib/clamav"]
EXPOSE 3310
ENTRYPOINT ["/entrypoint.sh"]
