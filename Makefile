SHELL=/bin/bash

default: build

build:
	-rm -fr _site/
	docker build -t carolynvanslyck.com .
	docker run \
  	--volume=`pwd`:/srv/jekyll \
  	carolynvanslyck.com \
  	bundle exec rake build

serve: build
	-docker ps --filter="name=jekyll" -aq | xargs -n1 docker rm -f
	docker run -d --name jekyll \
  	--volume=`pwd`:/srv/jekyll \
  	--publish 4000:4000 \
  	carolynvanslyck.com \
  	bundle exec rake serve
	( docker logs -f jekyll & ) | grep -q "Server running"
	open http://0.0.0.0:4000

ci:
	bundle exec rake build
