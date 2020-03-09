FROM alpine:latest
MAINTAINER thomas@bandixen.ch

RUN apk --no-cache add --update \
        openssh-client \
        curl \
        wget

RUN mkdir -p /usr/local/share/wifi-state-controller && \
        mkdir -p /etc/periodic/1min && \
        echo "0" > /usr/local/share/wifi-state-controller/LAST_STATE && \
        echo -e "*       *       *       *       *       run-parts /etc/periodic/1min\n" >> /etc/crontabs/root

COPY /scripts/* /
COPY /ssh-keys/* /root/.ssh/
# RUN ssh-keygen -b 4096 -t rsa -f /root/.ssh/id_rsa -q -N ""

COPY /1min/* /etc/periodic/1min/

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]
