SHELL=/bin/bash

default: serve

build:
	-rm -fr _site/
	docker build -t carolynvanslyck.com .
	docker run \
  	-v `pwd`:/srv/jekyll \
		-v /etc/localtime:/etc/localtime \
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
	cd _deploy && \
		git fetch origin && \
		git checkout gh-pages && \
		git reset --hard origin/gh-pages && \
		git clean -xdf
	rsync -a --delete --exclude .git --exclude talk _site/ _deploy/
	cd _deploy && git add -A && git commit -m "Site updated at `date`" && git push

.PHONY: build serve deploy
