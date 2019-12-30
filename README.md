
# cups-dymo

A Docker image for running a Node server and CUPS with DYMO drivers installed.

[Docker Hub](https://hub.docker.com/r/sleavely/cups-dymo)

## Running

Launching the servers is as easy as:

```shell
./run.sh
```

## Image development

The image is built for multiple architectures using `buildx`. This is to support running on ARM devices such as Raspberry Pi.

```shell
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t sleavely/cups-dymo:latest --push .
```


## Further reading & similar projects

- https://engineering.docker.com/2019/04/multi-arch-images/
- https://www.baitando.de/it/2017/12/12/install-dymo-labelwriter-on-headless-linux
- https://github.com/thbe/docker-cups
- https://github.com/dsandor/dymojs
