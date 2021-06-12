ID=$(docker build . | grep Success | cut -d ' ' -f3)
docker run -it $ID
