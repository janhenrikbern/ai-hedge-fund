IMAGE_NAME := ai_hedge_fund
CONTAINER_NAME := ai_hedge_fund_container

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -v /Users/janhenrikbernhard/dev/ai-hedge-fund:/home/ai-hedge-fund --name $(CONTAINER_NAME) $(IMAGE_NAME) sleep 50000

up: build run

bash:
	docker exec -it $(CONTAINER_NAME) sh

stop:
	docker stop $(CONTAINER_NAME)

clean: stop
	docker rm $(CONTAINER_NAME)
	