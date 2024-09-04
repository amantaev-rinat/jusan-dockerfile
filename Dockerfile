FROM nginx:mainline
LABEL maintainer="amantaev-rinat@mail.ru"

WORKDIR /docker/dockerfile/

# Создаем необходимую директорию
RUN mkdir -p /var/www/html/jusan-dockerfile


# Проверяем содержимое /opt, чтобы убедиться, что файлы разархивированы
RUN ls -al /opt

# Копируем конфигурационный файл в директорию nginx
COPY jusan-dockerfile.conf /etc/nginx/conf.d/jusan-dockerfile.conf

# Если файлы находятся в подпапке, используйте это
COPY jusan-dockerfile/* /var/www/html/jusan-dockerfile/

# Проверяем конфигурацию Nginx
RUN nginx -t
ENV PORT=8080
# Команда для запуска Nginx
CMD ["nginx", "-g", "daemon off;"]
