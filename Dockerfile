FROM alpine:3.11

LABEL maintainer="Yannick Zwicker <yzwicker@ins.hsr.ch>"

VOLUME  [ "/data" ]
RUN apk add --no-cache tcpdump coreutils bash

CMD [ "/usr/sbin/tcpdump", "-C", "1000", "-W", "100", "-v", "-w", "/data/dump" ]
