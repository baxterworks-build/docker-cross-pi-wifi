USERNAME="voltagex"
BASE_REPO="pi-kernel-cross-base"
#ARCH=arm
#DEBARCH=armhf


.PHONY: modules
all: modules

base:
	docker build . -f Dockerfile.base -t $(USERNAME)/$(BASE_REPO)
	docker push $(USERNAME)/$(BASE_REPO)

modules:
	./gimme.sh
	ls -lah output.tar.gz


