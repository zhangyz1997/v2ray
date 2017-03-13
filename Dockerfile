FROM alpine:3.5

ARG VER=2.20.2

RUN \
    apk add --no-cache --virtual .build-deps ca-certificates curl \
    && mkdir -p /opt/v2ray \
    && cd /opt/v2ray \
    && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
    && unzip v2ray.zip \
    && mv /opt/v2ray/v2ray-v$VER-linux-64/v2ray /opt/v2ray/ \
    && rm -rf v2ray.zip \
    && rm -rf v2ray-v$VER-linux-64 \
    && apk del .build-deps \
    && chgrp -Rv 0 /opt/v2ray \
    && chmod -Rv g+rwX /opt/v2ray 
 
ENV CONFIG_JSON=none V2RAY_CRT=none V2RAY_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
