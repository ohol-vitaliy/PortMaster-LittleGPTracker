FROM monkeyx/retro_builder:arm64

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y python3-pil

RUN ldconfig

WORKDIR /root
RUN git clone https://github.com/djdiskmachine/LittleGPTracker

WORKDIR /root/LittleGPTracker/projects
ADD Makefile.PORTMASTER .
RUN sed -i -E 's/(RG35XXPLUSDIRS := (.*$))/\1\nPORTMASTERDIRS := \2/g' Makefile \
	&& sed -i -E 's/(RG35XXPLUSFILES := (.*$))/\1\nPORTMASTERFILES := \2/g' Makefile
RUN make PLATFORM=PORTMASTER && mv lgpt-port.elf /root/lgpt

WORKDIR /root

