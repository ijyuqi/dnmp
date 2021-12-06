#!/bin/sh
echo "###### Install composer #########"
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && php composer-setup.php

mv composer.phar /usr/local/bin/composer

chmod +rwx /usr/local/bin/composer

rm -rf composer-setup.php

composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

composer -vvv
echo "######update composer ###########"
composer selfupdate
