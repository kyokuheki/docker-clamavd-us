# docker-clamavd-us
Unusable security is not security! This is a dockerized antivirus to comply sincerely with unusable security rules.

## How to build
```
git clone https://github.com/kyokuheki/docker-clamavd-us.git
cd docker-clamavd-us
docker build -t docker-clamavd-us --no-cache .
```

## How to run
Run clamavd
```
docker run -d --rm docker-clamavd-us
```

Run foreground
```
docker run -it --rm docker-clamavd-us
```

Run bash
```
docker run -it --rm docker-clamavd-us bash
```

## How to run with proxy

```
cat > Dockerfile <<_EOT_
FROM kyokuheki/docker-clamavd-us
RUN echo "HTTPProxyServer proxy.example.net" >> /etc/clamav/freshclam.conf \\
 && echo "HTTPProxyPort 8080" >> /etc/clamav/freshclam.conf
_EOT_
docker build -t docker-clamavd-us --no-cache .
docker run -d --restart=always docker-clamavd-us
```
