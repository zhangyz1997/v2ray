# v2ray 部署在 openshift starter

Docker 镜像：wangyi2005/v2ray

环境变量： CONFIG_JSON，用notepad++将配置文件中 \r\n 替换为\\\n，变成一行，导入容器。

openshift Secure Route mode：edge

安卓手机、pc可用同一个服务端。

PC端用http代理，域名远程解析，配置dns hosts sniproxy ，路由策略 AsIs。

Android 用socks代理，本地域名解析，配置dns hosts 和 server 8.8.8.8，路由策略IPIfNonMatch。

v2ray Outbound 用 freedom UseIP 启用 DNS，outboundDetour 作为 proxy。

v2ray 路由设置一个缺省路由，指向 proxy。

具体配置见 issues。
