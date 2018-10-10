SHELL=/bin/bash

default: serve

build:
	hugo build

serve:
	hugo serve
	
.PHONY: build serve
