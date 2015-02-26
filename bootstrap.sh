#!/usr/bin/env bash

# Set MySQL root password
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

# Install packages
apt-get update
apt-get -y install apache2 mysql-server php5-mysql libsqlite3-dev php5 php5-dev build-essential php-pear git


# Setup database
echo "DROP DATABASE IF EXISTS test" | mysql -uroot -proot

# Apache changes
echo "ServerName localhost" >> /etc/apache2/apache2.conf
a2enmod rewrite
cat /var/custom_config_files/apache2/default | tee /etc/apache2/sites-available/000-default.conf

#Install ruby 1.9.3

# Clone the rbenv repo from github
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
cd ~/.rbenv

# Add rbenv to PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.profile

# Install ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 1.9.3-p0
rbenv global 1.9.3-p0
rbenv rehash

# Install Mailcatcher
echo "Installing mailcatcher"
gem install mailcatcher --no-ri --no-rdoc
mailcatcher --http-ip=192.168.56.101

# Configure PHP
sed -i '/;sendmail_path =/c sendmail_path = "/usr/local/bin/catchmail"' /etc/php5/apache2/php.ini
sed -i '/display_errors = Off/c display_errors = On' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = On' /etc/php5/apache2/php.ini

# Make sure things are up and running as they should be
service apache2 restart
