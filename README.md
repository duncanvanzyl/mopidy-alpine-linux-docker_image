# mopidy-alpine-linux-docker_image

This is a fork of [neurove's mopidy alpine docker image](https://github.com/neurove/mopidy-alpine-linux-docker_image). It has been updated to use [Mopidy-ALSAMixer](https://mopidy.com/ext/alsamixer/).

[**Mopidy**](https://www.mopidy.com/) Docker image based on [**Alpine Linux**](https://www.alpinelinux.org/).

## Features

- Based on Alpine Linux: smaller than a debian or ubuntu based image.
- Runs on Raspberry Pi (tested on Model 4B, and Model 3B)
- Uses the latest mopidy version from the python3 pip repository.  
- Customizable: mopidy plugins can be added/removed by editing requirements.txt.  
- Includes Healtcheck for monitoring

## Usage

Configuration:

1. Edit the variables in Makefile.
2. Optional: add/remove plugins in requirements.txt
3. Optional: edit mopidy.conf  

Build, tag and push the docker Image:  
`$ make all`

Build and tag the docker Image:  
`$ make build`

Only build the docker Image:  
`$ make build-alpine.`

Tag the docker image with current date and latest:  
`$ make tag`

Push docker image to private docker repository:  
`$ make push`

## Frontend

You can access the available frontends at [http://localhost:6680].

## Updating files in mopidy-local

Using docker-compose:  
`$ docker-compose exec mopidy mopidy local scan`

Using docker:  
`$ docker exec CONTAINER_NAME mopidy local scan`

## Docker Compose

An example docker-compose file:

```compose
version: "3"
services:
  mopidy:
    image: neurove/mopidy:latest
    container_name: mopidy
    devices:
    - "/dev/snd"
    ports:
    - "6600:6600"
    - "6680:6680"
    environment:
    - TZ=Europe/Berlin
    restart: unless-stopped
    volumes:
    - /srv/music/:/music/
    - /home/pi/docker/mopidy/config/mopidy/:/home/mopidy/.config/mopidy/
    - /home/pi/docker/mopidy/config/asound.conf:/etc/asound.conf
```

## License

Open Source MIT License
