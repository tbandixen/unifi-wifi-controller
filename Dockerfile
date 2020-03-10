FROM alpine:latest
MAINTAINER thomas@bandixen.ch

RUN apk --no-cache add --update \
        openssh-client \
        curl \
        wget

COPY /ssh-keys/* /root/.ssh/
COPY /1min/* /etc/periodic/1min/
COPY /nightly/disable.sh /usr/local/share/wifi-state-controller/disable.sh

RUN mkdir -p /usr/local/share/wifi-state-controller && \
        chmod -R 0600 /root/.ssh && \
        chmod -R +x /etc/periodic/1min/ && \
        chmod +x /usr/local/share/wifi-state-controller/disable.sh

RUN echo "2" > /usr/local/share/wifi-state-controller/LAST_STATE && \
        echo -e "*       *       *       *       *       run-parts /etc/periodic/1min\n" >> /etc/crontabs/root && \
        echo -e "59       18       *       *       *       /usr/local/share/wifi-state-controller/disable.sh\n" >> /etc/crontabs/root

CMD ["crond", "-f", "-l", "8"]
