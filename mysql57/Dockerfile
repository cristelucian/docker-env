FROM mysql:5.7

LABEL maintainer "lucian.criste@sepa.at"

ADD disable_strict_mode.cnf  /etc/mysql/conf.d/disable_strict_mode.cnf

RUN service mysql restart
