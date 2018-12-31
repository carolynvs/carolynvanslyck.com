SHELL=/bin/bash

default: serve

build:
	hugo build

serve:
	hugo serve -b http://localhost/

.PHONY: build serve
