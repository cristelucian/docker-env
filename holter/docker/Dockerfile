FROM ubuntu:16.04

LABEL maintainer "lucian.criste@russmedia.com"

RUN apt-get update -y
RUN apt-get install software-properties-common   --no-install-recommends -y libpq-dev -y

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install -y apache2 php7.0 php7.0-mbstring libapache2-mod-php7.0 \
                      php7.0-mysql  php7.0-pdo php7.0-xml php7.0-intl  \ 
                      php7.0-curl php7.0-mysql php7.0-xml php7.0-gd \
                      php7.0-mbstring 

RUN apt-get install -y vim
RUN apt-get install -y nano
RUN apt-get install -y curl
RUN apt-get install -y imagemagick
RUN apt-get install -y php-imagick
RUN apt-get install sudo
RUN apt-get install mysql-client -y
RUN a2enmod rewrite

#other services
RUN apt-get install -y \
      curl \
      grep \
      wget \
      git \
      vim \
      supervisor \ 
      screen \
      nano

RUN curl -sS https://getcomposer.org/installer | \
    sudo php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y php-intl php-mcrypt
#enable mycrypt module
RUN a2enmod rewrite
RUN a2enmod headers
RUN apt-get install -y 
RUN  phpenmod pdo_mysql
#apache
ADD holter-home.conf /etc/apache2/sites-available/holter-home.conf
RUN a2ensite holter-home.conf
#RUN a2dissite 000-default.conf
#timezone
RUN rm  -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime

#apache2
RUN sed -i \
        -e "s/memory_limit\s*=\s*128M/memory_limit = 1024M/g" \
        /etc/php/7.0/apache2/php.ini


RUN sed -i \
        -e "s/;realpath_cache_size/realpath_cache_size /g" \
        /etc/php/7.0/apache2/php.ini

RUN sed -i \
        -e "s/;realpath_cache_ttl\s*=\s*120/realpath_cache_ttl=600/g" \
        /etc/php/7.0/apache2/php.ini


RUN sed -i \
        -e "s/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=20000/g" \
        /etc/php/7.0/apache2/php.ini



RUN sed -i \
        -e "s/post_max_size = 8M/post_max_size = 20M/g" \
        /etc/php/7.0/apache2/php.ini

RUN sed -i \
        -e "s/; max_input_vars = 1000/ max_input_vars = 5000/g" \
        /etc/php/7.0/apache2/php.ini



#cli
RUN sed -i \
        -e "s/memory_limit\s*=\s*128M/memory_limit = 1024M/g" \
        /etc/php/7.0/cli/php.ini

RUN echo   "post_max_size = 20M" >> /etc/php/7.0/cli/php.ini

RUN sed -i \
        -e "s/;realpath_cache_ttl\s*=\s*120/realpath_cache_ttl=600/g" \
        /etc/php/7.0/cli/php.ini

RUN sed -i \
        -e "s/;realpath_cache_size/realpath_cache_size /g" \
        /etc/php/7.0/cli/php.ini


RUN sed -i \
        -e "s/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=20000/g" \
        /etc/php/7.0/cli/php.ini


#supervisor conf
ADD supervisord.conf /etc/supervisord.conf

#startup script
COPY prepare.sh  .
COPY start.sh  .
COPY task.sh  .
RUN  chmod +x start.sh prepare.sh task.sh
RUN export TERM='xterm'

WORKDIR /var/www
#ports

#timezone
RUN rm  -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime
