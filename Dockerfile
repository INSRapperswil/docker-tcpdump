FROM alpine:3.11

LABEL maintainer="Yannick Zwicker <yzwicker@ins.hsr.ch>"

COPY --chown=root:root docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache --update \
        openssh \
        tcpdump \
        bash \
    && rm  -rf /tmp/* /var/cache/apk/* \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd

EXPOSE 22

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D","-e"]