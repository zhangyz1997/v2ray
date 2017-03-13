FROM alpine:3.5

ENV CONFIG_JSON=none V2RAY_CRT=none V2RAY_KEY=none VER=2.20.2

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -p /v2ray/bin \   
 && cd /v2ray \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /v2ray/v2ray-v$VER-linux-64/v2ray /v2ray/bin/ \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 \
 && chgrp -R 0 /v2ray/bin \
 && chmod -R g+rwX /v2ray/bin 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
