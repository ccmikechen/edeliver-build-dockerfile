# edeliver-build-dockerfile

Sometimes your cloud production machine is too slow to build releases and the OS of your computer and production machine are not the same (like mine). So you need a docker container that can build releases in similar environment to your production machine. This is what you need!

## Build image

```bash
docker build --rm -t [IMAGE_NAME] .
```

## Create and start a container (fish)

```fish
set BUILD_USER=build
set SSH_AUTHORIZED_KEYS=[public keys]

docker run -d --name [CONTAINER_NAME] -p 2020:22 --env "SSH_USER=$BUILD_USER" --env "SSH_AUTHORIZED_KEYS=$AUTHORIZED_KEYS" [IMAGE_NAME]
```

## Connect to container via SSH

```bash
ssh build@localhost:2020
```
