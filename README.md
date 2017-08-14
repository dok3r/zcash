# dok3r/zcash

Zcash inside docker

Image is based on the [debian](https://hub.docker.com/_/debian/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/dok3r/zcash.svg)](https://imagelayers.io/?images=dok3r/zcash:latest 'latest')

## Docker image usage

```
docker run [docker-options] dok3r/zcash
```

## Examples

Typical basic usage (start zcashd daemon): 

```
docker run -it dok3r/zcash zcashd
```

Typical usage to mine:

```
docker run -it dok3r/zcash zcashd -gen
```

Typical usage to perform query:

```
docker run -d --name zcashcont dok3r/zcash zcashd
docker exec -u zcash zcashcont zcash-cli getbalance
```

### Todo
- [ ] Perform more testing

