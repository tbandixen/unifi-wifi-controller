FROM alpine:latest
MAINTAINER thomas@bandixen.ch

RUN apk --no-cache add --update \
        openssh-client \
        curl \
        wget

RUN mkdir -p /usr/local/share/wifi-state-controller && \
        mkdir -p /etc/periodic/1min && \
        echo "2" > /usr/local/share/wifi-state-controller/LAST_STATE && \
        echo -e "*       *       *       *       *       run-parts /etc/periodic/1min\n" >> /etc/crontabs/root

COPY /ssh-keys/* /root/.ssh/
RUN chmod -R 0600 /root/.ssh

COPY /1min/* /etc/periodic/1min/
RUN chmod -R +x /etc/periodic/1min/

CMD ["crond", "-f", "-l", "8"]
