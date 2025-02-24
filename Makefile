IMAGE_NAME := ai_hedge_fund
CONTAINER_NAME := ai_hedge_fund_container

build:
	docker build -t $(IMAGE_NAME) .

run: WORKDIR = $(shell if [ "$(shell basename $(shell pwd))" = "ai-hedge-fund" ]; then pwd; else echo "Error: Not in ai-hedge-fund directory" >&2; exit 1; fi)
run: 
	docker run -it -v $(WORKDIR):/app/ --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/bash

dev: build run

stop:
	docker stop $(CONTAINER_NAME)

clean: stop
	docker rm $(CONTAINER_NAME)
	