
# cups-dymo

A Docker image for running a Node server and CUPS with DYMO drivers installed. It has been successfully tested on a DYMO LabelWriter 450 Turbo.

[Docker Hub](https://hub.docker.com/r/sleavely/cups-dymo)

## Running

Make sure your DYMO printer is plugged in and launch the servers by running the start-up script in your terminal:

```shell
./run.sh
```

You can verify that the printer is working by running the following against your Docker container:

```shell
docker exec -it cups-dymo bash

echo "Hello world!" > test.txt

lp test.txt
```

## Image development

The image is built for multiple architectures using `buildx`. This is to support running on ARM devices such as Raspberry Pi.

To enable `buildx` you may need to enable experimental features in your Docker installation. The easiest way to achieve this is probably by setting the `DOCKER_CLI_EXPERIMENTAL=enabled` environment variable.

Once you have `buildx` [set up](https://engineering.docker.com/2019/04/multi-arch-images/), run the following to build the image:

```shell
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t sleavely/cups-dymo:latest --push .
```

## Further reading & similar projects

- https://engineering.docker.com/2019/04/multi-arch-images/
- https://www.baitando.de/it/2017/12/12/install-dymo-labelwriter-on-headless-linux
- https://github.com/thbe/docker-cups
- https://github.com/dsandor/dymojs
