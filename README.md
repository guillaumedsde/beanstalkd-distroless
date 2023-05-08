# [🐋 Beanstalkd-distroless](https://github.com/guillaumedsde/beanstalkd-distroless)

[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/guillaumedsde/beanstalkd-distroless)](https://hub.docker.com/r/guillaumedsde/beanstalkd-distroless/tags)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/guillaumedsde/beanstalkd-distroless)](https://hub.docker.com/r/guillaumedsde/beanstalkd-distroless)
[![Docker Pulls](https://img.shields.io/docker/pulls/guillaumedsde/beanstalkd-distroless)](https://hub.docker.com/r/guillaumedsde/beanstalkd-distroless)
[![GitHub stars](https://img.shields.io/github/stars/guillaumedsde/beanstalkd-distroless?label=Github%20stars)](https://github.com/guillaumedsde/beanstalkd-distroless)
[![GitHub watchers](https://img.shields.io/github/watchers/guillaumedsde/beanstalkd-distroless?label=Github%20Watchers)](https://github.com/guillaumedsde/beanstalkd-distroless)
[![Docker Stars](https://img.shields.io/docker/stars/guillaumedsde/beanstalkd-distroless)](https://hub.docker.com/r/guillaumedsde/beanstalkd-distroless)
[![GitHub](https://img.shields.io/github/license/guillaumedsde/beanstalkd-distroless)](https://github.com/guillaumedsde/beanstalkd-distroless/blob/master/LICENSE.md)


This repository contains the code to build a small and secure **[distroless](https://github.com/GoogleContainerTools/distroless)** **docker** image for **[Beanstalkd](https://github.com/beanstalkd/beanstalkd)** which can be run as an unprivileged user.
The final images are built and hosted on the [dockerhub](https://hub.docker.com/r/guillaumedsde/beanstalkd-distroless).

## ✔️ Features summary

- 🥑 [distroless](https://github.com/GoogleContainerTools/distroless) minimal image
- 🤏 As few Docker layers as possible
- 🛡️ only basic runtime dependencies
- 🛡️ Runs as unprivileged user with minimal permissions

## 🏁 How to Run

### `docker run`

```bash
$ docker run  --read-only \
              --user "$(id -u):$(id -g)" \
              --port "11300:11300" \
              guillaumedsde/beanstalkd-distroless:latest
```

### `docker-compose.yml`

```yaml
version: "3.3"
services:
  beanstalkd-distroless:
    user: 1000:1000
    read_only: true
    ports:
      - 11300:11300
    image: "guillaumedsde/beanstalkd-distroless:latest"
```

## 🖥️ Supported platforms

This container is built for many hardware platforms:

- linux/amd64

All you have to do is use a recent version of docker and it will pull the appropriate version of the image from the docker hub.

## 🙏 Credits

A couple of projects really helped me out while developing this container:

- 💽 [Beanstalkd](https://github.com/beanstalkd/beanstalkd) _the_ awesome software
- 🥑 [Google's distroless](https://github.com/GoogleContainerTools/distroless) base docker images
- 🐋 The [Docker](https://github.com/docker) project (of course)
