SHELL=/bin/bash

default: build

build:
	-@rm -fr _site/
	docker run \
  	--volume=`pwd`:/src \
  	carolynvs.github.io \
  	build

preview:
	rm -fr _site &> /dev/null
	docker build -t carolynvs.github.io .
	-@docker ps --filter="name=jekyll" -aq | xargs -n1 docker rm -f
	docker run -d --name jekyll \
  	--volume=`pwd`:/src \
  	--publish 4000:4000 \
  	carolynvs.github.io \
  	serve --watch --drafts -H 0.0.0.0
	open http://0.0.0.0:4000

deploy:
	docker run --rm \
  	--volume=`pwd`:/src \
  	carolynvs.github.io \
  	deploy
