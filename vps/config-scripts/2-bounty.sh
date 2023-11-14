#!/bin/bash

bounty-directory $1 () {
 mkdir -p $1/{recon,www,exploit,pivot,report} && cd $1
}

bounty $1 () {
	if [ ! -d `pwd`/.bounty-logs ];
	then
    mkdir -p $1/{recon,www,exploit,pivot,report} && cd $1 && \
    mkdir .bounty-logs \
    && docker run --name $1 -it \
    --net=host --entrypoint=/bin/zsh \
		--cap-add=NET_ADMIN \
    -e DISPLAY=$DISPLAY -e DOMAIN=$DOMAIN \
		-e TARGET=$TARGET -e IP=$IP -e TZ=$TIME_ZONE -e NAME=$1 \
    -v `pwd`/.bounty-logs:$HOME/.logs:rw -v `pwd`:/$1 \
    -v $HOME/.Xauthority:$HOME/.Xauthority:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -w /$1 fonalex45/bounty-sec:latest
	else
		docker run --name $1 -it \
		--net=host --entrypoint=/bin/zsh \
		--cap-add=NET_ADMIN \
		-e DOMAIN=$DOMAIN -e DISPLAY=$DISPLAY \
    -e TARGET=$TARGET -e IP=$IP \
    -e TZ=$TIME_ZONE -e NAME=$1 \
		-v `pwd`/.bounty-logs:/root/.logs:rw -v `pwd`:/$1 \
		-v $HOME/.Xauthority:$HOME/.Xauthority:ro -v /tmp/.X11-unix:/tmp/.X11-unix \
		-w /$1 fonalex45/bounty-sec:latest
	fi
}

bounty-start $1 ()
{
 docker container start $1 && docker container exec -it $1 /bin/zsh
}

bounty-enter $1 ()
{
docker exec -it $1 /bin/zsh
}

bounty-stop $1 () {
 docker container stop $1
}

bounty-destory $1 () {
 docker container rm $1
}

bounty-pull () {
  docker pull fonalex45/bounty-sec:latest
}
