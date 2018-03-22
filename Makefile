SHELL=/bin/bash

default: serve

build:
	-rm -fr _site/
	docker build -t carolynvanslyck.com .
	docker run --rm \
  	-v `pwd`:/srv/jekyll \
		-v ~/etc/timezone:/etc/localtime:ro \
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
	docker logs -f jekyll

ci:
	bundle exec rake build

_deploy:
	git clone --branch gh-pages `git remote get-url origin` _deploy

deploy: build _deploy
	scripts/deploy.sh

.PHONY: build serve deploy ci
