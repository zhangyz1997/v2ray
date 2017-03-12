cd /go/bin/v2ray

if [ "$v2ray_crt" != "$v2ray_key" ]; then
  echo -e "$v2ray_crt" > v2ray.crt
  echo -e "$v2ray_key"  > v2ray.key
  echo -e "$CONFIG_JSON" > config.json
fi
./v2ray
