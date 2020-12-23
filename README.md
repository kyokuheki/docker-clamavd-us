# docker-clamavd-us
Unusable security is not security! This is a dockerized antivirus to comply sincerely with unusable security rules.

## How to build
```
git clone https://github.com/kyokuheki/docker-clamavd-us.git
cd docker-clamavd-us
docker build -t kyokuheki/clamavd-us --no-cache .
```

## How to run
Run clamavd
```shell
docker run -d --rm kyokuheki/clamavd-us
```

Run foreground
```shell
docker run -it --rm kyokuheki/clamavd-us
```

Run bash
```shell
docker run -it --rm kyokuheki/clamavd-us bash
```

### How to run with proxy

```shell
cat > Dockerfile <<_EOT_
FROM kyokuheki/clamavd-us
RUN echo "HTTPProxyServer proxy.example.net" >> /etc/clamav/freshclam.conf \\
 && echo "HTTPProxyPort 8080" >> /etc/clamav/freshclam.conf
_EOT_
docker build -t clamavd-us --no-cache .
docker run -d --restart=always --name clamavd -v clamavd:/var/lib/clamav kyokuheki/clamavd-us
```

### Enable clamonacc

```shell
docker run -d --restart=always --name clamavd --cap-add SYS_ADMIN -v clamavd:/var/lib/clamav kyokuheki/clamavd-us:clamonacc
```

