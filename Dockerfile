FROM voltagex/pi-kernel-cross-base
COPY builder.sh /src/
WORKDIR /src/
RUN apt install patch
