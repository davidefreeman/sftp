FROM alpine:latest
#MAINTAINER Adrian Dvergsdal [atmoz.net] - Before fork
MAINTAINER Alexandre NICOLAIE [pheonyx.net]

RUN apk add --no-cache                \
            openssh                   \
            openssh-sftp-server       \
            bash                      \
    && mkdir -p /var/run/sshd         \
    && rm -f /etc/ssh/ssh_host_*key*

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /

VOLUME /etc/ssh

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
