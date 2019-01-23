FROM mysql:5.7

ENV MYSQL_DATABASE="spotify_player"
ENV MYSQL_ROOT_PASSWORD="111"

ADD spotify_player_create.sql /docker-entrypoint-initdb.d
ADD spotify_player_fill.sql /docker-entrypoint-initdb.d
ADD charset.cnf /etc/mysql/conf.d

