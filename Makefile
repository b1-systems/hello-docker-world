# build the hello-deocker-world binary on x86_64

all: dockerimage

hello-docker-world: hello-docker-world.s
	@echo "build the Hello World application/binary"
	@as hello-docker-world.s -o hello-docker-world.o
	@ld -s -o hello-docker-world hello-docker-world.o

dockerimage: hello-docker-world
	@echo "Build the Dockerimage"
	@docker build . \
		-t docker-hello-world:1.0 \
		-t docker-hello-world:latest
clean:
	@echo "Clean the Application build artifacts"
	@rm -f *.o hello-docker-world

# eof
