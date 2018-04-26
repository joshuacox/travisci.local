TAG=joshuacox/travisci.local

all: rm build run logs

build:
	docker build -t $(TAG) .

run:
	docker run \
		-d \
		-it \
		--cidfile=.travis.local.cid \
		$(TAG) \
		/assets/start.sh transmute-industries transmute master

bash:
	docker run -it $(TAG) /bin/bash

exec:
	docker exec -it `cat .travis.local.cid` /bin/bash

logs:
	docker logs -f `cat .travis.local.cid`

rm:
	-@docker stop `cat .travis.local.cid`
	-@docker rm `cat .travis.local.cid`
	-@rm .travis.local.cid
