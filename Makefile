SHELL=/bin/bash

default: serve

build: clean
	@docker run --rm -v $$PWD:/src -p 1313:1313 klakegg/hugo:0.48-ext-alpine

serve: clean
	-@docker rm -f carolynvanslyck.com
	@docker run -d -v $$PWD:/src -p 1313:1313 --name carolynvanslyck.com \
	klakegg/hugo:0.48-ext-alpine server -D -F --noHTTPCache --watch --bind=0.0.0.0

clean:
	-rm -r public/

.PHONY: build serve
