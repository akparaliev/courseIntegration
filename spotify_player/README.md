``` bash or cmd
docker build -t spotify-mysql .
```

Запускать контейнер рекомендуется так:
``` bash or cmd
docker run --name spotify-mysql --rm -d -p 3306:3306 spotify-mysql
```

Если у вас нет установленного клиента ```mysql```, вы можете воспользоваться встроенным в docker-контейнер(если команда не выполнилось, нужно выполнить еще раз):
``` bash or cmd
docker exec -it spotify-mysql mysql -uroot -p111
```
Обращаем внимание, что в некоторых случаях непосредственно после запуска контейнера подключение может быть доступно не сразу.
Проверьте корректность выполнения запроса:

``` sql
USE spotify_player;
SELECT * FROM music;
```

