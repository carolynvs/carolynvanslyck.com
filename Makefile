SHELL=/bin/bash

default: serve

build:
	scripts/build.sh

serve: build
	scripts/serve.sh

_deploy:
	git clone --branch gh-pages `git remote get-url origin` _deploy

deploy: build _deploy
	scripts/deploy.sh

.PHONY: build serve deploy
