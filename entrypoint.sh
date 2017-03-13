cd /v2ray/bin
echo -e "$V2RAY_CRT" > v2ray.crt
echo -e "$V2RAY_KEY" > v2ray.key
echo -e "$CONFIG_JSON" > config.json
./v2ray
