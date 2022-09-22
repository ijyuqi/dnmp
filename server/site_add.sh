#!/bin/bash
echo '按下 <CTRL-Z> 退出'
echo "添加站点"

echo -n "输入站点域名:(localhost):"
read DOMAIN_NAME
if [[ -z $DOMAIN_NAME ]]; then
	DOMAIN_NAME='localhost'
fi

echo -n "输入站点文件名:(localhost):"
read SITE_FILENAME
if [[ -z $SITE_FILENAME ]]; then
	SITE_FILENAME='localhost'
fi

# 创建文件夹
if [[ ! -d $SITE_FILENAME ]]; then
	mkdir -p ./../www/$SITE_FILENAME
	echo "创建文件夹${SITE_FILENAME}"
fi

echo -n "输入端口号:(默认80):"
read PORT
if [[ -z $PORT ]]; then
	PORT=80
fi

cd ./nginx/

sed "s/@DOMAIN_NAME/${DOMAIN_NAME}/g" localhost.templet.conf | sed "s/@SITE_FILENAME/${SITE_FILENAME}/g" | sed "s/@PORT/${PORT}/g" > ./conf.d/${SITE_FILENAME}_${PORT}.conf

echo "站点域名: $DOMAIN_NAME"
echo "站点文件夹: $SITE_FILENAME"
echo "站点端口号: $PORT"

echo "配置全局配置文件.env"
echo "NGINX_HTTP_HOST_PORT_${PORT}=${PORT}"


#sed -i "/NGINX_VERSION=latest/a\NGINX_HTTP_HOST_PORT_${PORT}=${PORT}" .env
sed -i '/NGINX_VERSION=latest/a\NGINX_HTTP_HOST_PORT_12=12' .env

echo "Create a successful!"

