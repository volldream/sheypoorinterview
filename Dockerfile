FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt-get install -y gnupg2 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 \
    && echo 'deb [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ bionic nginx' >> /etc/apt/sources.list.d/nginx.list \
    && apt-get update \
    && apt-get install locales \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && apt-get install -y software-properties-common \
    && apt-get update

RUN apt-get install -y \
    nginx \
    vim \
    php7.2-fpm \
    openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./nginx /etc/nginx
COPY ./docker-run.sh /docker-run.sh

COPY index.php /var/www/html/

EXPOSE 80

CMD ["/bin/bash", "docker-run.sh"]