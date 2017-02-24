# the smallest docker Hello World example
#
FROM scratch
LABEL authors="Thorsten Schifferdecker <schifferdecker@b1-systems.de>"
ADD hello-docker-world /hello-docker-world
CMD ["/hello-docker-world"]
