SHELL=/bin/bash
JEKYLL_IMAGE="jekyll/jekyll:3.2.1"

default: build

sass:
	-rm -fr _site/
	docker run \
  	--volume=`pwd`:/srv/jekyll \
  	${JEKYLL_IMAGE} \
  	bundle exec rake sass

build:
	-rm -fr _site/
	docker run \
  	--volume=`pwd`:/srv/jekyll \
  	${JEKYLL_IMAGE} \
  	bundle exec rake build

serve:
	-docker ps --filter="name=jekyll" -aq | xargs -n1 docker rm -f
	docker run -d --name jekyll \
  	--volume=`pwd`:/srv/jekyll \
  	--publish 4000:4000 \
  	${JEKYLL_IMAGE} \
  	bundle exec rake serve
	open http://0.0.0.0:4000

ci:
	bundle exec rake build
