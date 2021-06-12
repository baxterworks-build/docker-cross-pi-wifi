USERNAME="voltagex"
BASE_REPO="pi-kernel-cross-base"
#ARCH=arm
#DEBARCH=armhf
base:
	docker build . -f Dockerfile.base -t $(USERNAME)/$(BASE_REPO)
	docker push $(USERNAME)/$(BASE_REPO)

#run:
	#ID := $(shell docker build . | grep Success| cut -d ' ' -f3)
	#docker run -it $ID
