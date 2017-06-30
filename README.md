# v2ray 部署在 openshift starter

Docker 镜像：wangyi2005/v2ray

环境变量： CONFIG_JSON，用notepad++将配置文件中 \r\n 替换为\\\n，变成一行，导入容器。

openshift Secure Route mode：edge

android V2rayGO、windows客户端可用同一个服务端。

具体配置见 issues。
