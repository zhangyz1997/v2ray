cd /go/bin/v2ray-linux-64

if [ "$v2ray_crt" != "$v2ray_key" ]; then
  echo -e "$v2ray_crt" > v2ray.crt
  echo -e "$v2ray_key"  > v2ray.key
  echo -e "$CONFIG_JSON" > config.json
fi
./v2ray -c config.json
