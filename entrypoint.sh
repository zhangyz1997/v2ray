cd /go/bin/v2ray-linux-64

if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > cert.pem
  echo -e "$KEY_PEM"  > key.pem
  echo -e "$CONFIG_JSON" > config.json
fi
./v2ray -c config.json
