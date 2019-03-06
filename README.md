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
