# the smallest docker Hello World example with multistage build

# build the build environment
FROM alpine:latest as dev-container
WORKDIR /app
COPY hello-docker-world.s ./
RUN apk -U --no-cache add build-base \
	&& as hello-docker-world.s -o hello-docker-world.o \
	&& ld -s -o hello-docker-world hello-docker-world.o

# build the application docker image
FROM scratch
LABEL authors="Thorsten Schifferdecker <schifferdecker@b1-systems.de>"
COPY --from=dev-container /app/hello-docker-world /hello-docker-world
ENTRYPOINT ["/hello-docker-world"]
