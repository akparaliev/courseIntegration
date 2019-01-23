``` bash or cmd
docker build -t custom-mysql .
```

Запускать контейнер рекомендуется так:
``` bash or cmd
docker run --name custom-mysql --rm -d -p 3307:3307 custom-mysql
docker run --name custom-mysql --rm -d -p 3307:3306 custom-mysql

```

Если у вас нет установленного клиента ```mysql```, вы можете воспользоваться встроенным в docker-контейнер(если команда не выполнилось, нужно выполнить еще раз):
``` bash or cmd
docker exec -it custom-mysql mysql -uroot -p111


```
Обращаем внимание, что в некоторых случаях непосредственно после запуска контейнера подключение может быть доступно не сразу.
Проверьте корректность выполнения запроса:

``` sql
USE custom_player;
SELECT * FROM song;
```

