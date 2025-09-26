APP := goserver
IMG := itk1m/goserver
TAG ?= 0.2.0
PORT ?= 8991

.PHONY: build bin image run push stop logs clean

bin:
	GOOS=linux GOARCH=amd64 go build -o $(APP)

image: bin
	docker build -t $(IMG):$(TAG) .

run:
	docker run --rm -p $(PORT):$(PORT) $(IMG):$(TAG)

push:
	docker push $(IMG):$(TAG)

stop:
	@cid=$$(docker ps -q --filter ancestor=$(IMG):$(TAG)); \
	if [ -n "$$cid" ]; then docker stop $$cid; else echo "no running container for $(IMG):$(TAG)"; fi

logs:
	@cid=$$(docker ps -q --filter ancestor=$(IMG):$(TAG)); \
	if [ -n "$$cid" ]; then docker logs -f $$cid; else echo "no running container for $(IMG):$(TAG)"; fi

clean:
	rm -f $(APP)
	docker rmi $(IMG):$(TAG) || true