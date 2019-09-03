FROM alpine

LABEL maintainer Kyokuheki <kyokuheki@gmail.com>

RUN apk add --no-cache clamav clamav-daemon clamav-libunrar freshclam
ADD *.conf /etc/clamav/

#RUN mkdir /run/clamav \
# && chown clamav:clamav /run/clamav \
# && chmod 750 /run/clamav
#RUN freshclam

VOLUME ["/var/lib/clamav"]
EXPOSE 3310
CMD freshclam && ( freshclam -d -c 1 & clamd )
