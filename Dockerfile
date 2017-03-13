FROM alpine:3.5

ARG VER=2.20.2

RUN adduser -D -G root -h /v2ray v2ray \
    && apk add --no-cache --virtual .build-deps ca-certificates curl 
    
USER v2ray  

RUN cd /v2ray \
    && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
    && unzip v2ray.zip \
    && chgrp -R 0 /v2ray \
    && chmod -R g+rwX /v2ray \
    && ls -l / \
    && ls -l \
    && rm -rf v2ray.zip \
    && apk del .build-deps 
   
ENV CONFIG_JSON=none V2RAY_CRT=none V2RAY_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER v2ray

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
