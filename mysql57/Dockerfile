FROM mysql:5.7

LABEL maintainer "lucian.criste@sepa.at"

ADD disable_strict_mode.cnf  /etc/mysql/conf.d/disable_strict_mode.cnf
ADD custom_log.cnf  /etc/mysql/conf.d/custom_log.cnf
ADD custom_setup.cnf  /etc/mysql/conf.d/custom_setup.cnf
RUN service mysql restart

