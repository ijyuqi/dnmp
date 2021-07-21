#!/bin/bash
echo '按下 <CTRL-Z> 退出'
echo "添加站点"

echo -n "输入站点域名:(localhost):"
read DOMAIN_NAME
if [ ! $DOMAIN_NAME ]; then
	$DOMAIN_NAME = 'localhost'
fi

echo -n "输入站点文件名:"
read SITE_FILENAME
if [ ! -d $SITE_FILENAME ]; then
	mkdir -p ./../www/$SITE_FILENAME
	echo " the site filename which you want create"
	exit
fi

echo -n "输入端口号:(默认80):"
read PORT
if [ ! $PORT ]; then
	$PORT = '80'
fi

cd ./nginx/
sed "s/@DOMAIN_NAME/${DOMAIN_NAME}/g" localhost.templet.conf | sed "s/@SITE_FILENAME/${SITE_FILENAME}/g" | sed "s/@PORT/${PORT}/g" > ./conf.d/${SITE_FILENAME}.conf

echo "Create a domain name: $DOMAIN_NAME"
echo "Create site folder: $SITE_FILENAME"
echo "Site port number: $PORT"
echo "配置全局配置文件.env"
sed -i "/NGINX_HTTP_HOST_PORT/a\NGINX_HTTP_HOST_PORT_$PORT = $PORT" .env



echo "Create a successful!"

#docker-compose stop
#docker-compose up -d
