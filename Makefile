SHELL=/bin/bash

default: serve

build: clean
	hugo build

serve: clean
	hugo serve -b http://localhost/

clean:
	-rm -r public/

.PHONY: build serve
