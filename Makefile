DATE := $(shell date +"%Y-%m-%d")
REPOSITORY=example.com
MUSIC_DIR=/mnt/music
PLAYLIST_DIR=/mnt/playlists
IMAGE_NAME=neurove/mopidy

all:
        make build && make push

build:
        make build-alpine && make tag

build-alpine:
        docker build --pull -t neurove/mopidy:$(DATE) . 

tag:
        docker tag neurove/mopidy:$(DATE) $(IMAGE_NAME):latest
        docker tag neurove/mopidy:$(DATE) $(REPOSITORY):5000/$(IMAGE_NAME):latest

push:
        docker push $(REPOSITORY):5000/$(IMAGE_NAME):latest
