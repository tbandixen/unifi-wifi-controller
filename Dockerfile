FROM alpine:latest
MAINTAINER thomas@bandixen.ch

ENV API_URL=https://www.google.com/ SSH_USER=root

RUN apk --no-cache add --update \
        openssh-client \
        curl
#        wget

COPY /ssh-keys/ /root/.ssh/
COPY /periodic/ /etc/periodic/
# COPY /nightly/endisable.sh /usr/local/share/wifi-state-controller/endisable.sh

RUN mkdir -p /usr/local/share/wifi-state-controller && \
        chmod -R 0600 /root/.ssh && \
        chmod -R +x /etc/periodic/
#        chmod +x /usr/local/share/wifi-state-controller/endisable.sh

RUN echo "2" > /usr/local/share/wifi-state-controller/LAST_STATE && \
        echo -e "*       *       *       *       *       run-parts /etc/periodic/1min\n" >> /etc/crontabs/root
#        echo -e "0       19       *       *       *       /usr/local/share/wifi-state-controller/endisable.sh 0\n" >> /etc/crontabs/root && \
#        echo -e "0       7       *       *       *       /usr/local/share/wifi-state-controller/endisable.sh 1\n" >> /etc/crontabs/root

CMD ["crond", "-f", "-l", "8"]
