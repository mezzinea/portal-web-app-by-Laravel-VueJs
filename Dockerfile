FROM php:7.1
RUN apt-get update -y && apt-get install -y libmcrypt-dev openssl

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --version=1.0.0-alpha8
RUN php -r "unlink('composer-setup.php');"




WORKDIR /app
COPY . /app


EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
