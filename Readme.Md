
# Лабораторная работа №1 "Доступ к разнородным БД на основе онтологий"
## Задание
Задача:

- Выбрать предметную область. Примером предметной области представлены две базы данных  с информацией о музыке, альбомах и исполнителях.

- Развернуть 2 реалиционные БД и наполнить их данными в соответствии с требованиями:

- Каждая из БД должна иметь отличную от другой схему данных, т.е. разные наименования таблиц и полей, а так же разная структура таблиц,
- Данные в обоих БД не должны полностью дублироваться.
- Разработать онтологию для предметной области. При разработке онтологии необходимо определить компетентностные вопросы.

- Развернуть Ontop и подключить его к БД.

- Настроить маппинги онтологии на схемы данных БД с помощью соответствующего плагина к Protege.
- Подговить SPARQL запросы к Ontop, в соответствии с определенными ранее компетентностными вопроса

# Пример развёртывания системы Ontop для базы данных MySQL
Для демонстрации возможностей системы Ontop развернём простую реляционную базу данных. Наша цель: сделать возможным обращение к базе данных SQL как к онтологии - с помощью SPARQL-запросов. В данном примере мы используем базу данных MySQL, развёрнутую в docker-контейнере, и плагин Ontop для Protege.

Для дальнейшей работы нам потребуются:

- MySQL Server или Docker-образ с предуставноленной MySQL Server;
- Docker;
- Git;
- Protege 5 или выше (пример протестирован на Protege 5.2, его и рекомендуется использовать);
- [JDBC-драйвер для MySQL](https://dev.mysql.com/downloads/connector/j/) (рекомендуется использовать версию Platform Independent);
- SQL-скрипты для построения базы данных.
Перед началом работы склонируйте репозиторий на локальную машину с помощью `git.`

## 1. Развёртывание базы данных
Мы продемонстрируем развёртывание СУБД MySQL в Docker-контейнере. Этот же контейнер может быть достаточно быстро развёрнут на любой машине. 
- Находясь в директории со склонированным репозиторием, запустите команды описаные в файле [custom_player](https://github.com/akparaliev/courseIntegration/tree/master/custom_player/README.md)

- Находясь в директории со склонированным репозиторием, запустите команды описаные в файле [spotify_player](https://github.com/akparaliev/courseIntegration/tree/master/spotify_player/README.md) для развертывания второй базы данных

## 2. Настройка Protege
Для работы с Ontop в Protege необходимо установить соответствующий плагин. Его можно поставить автоматически: `File -> Check for plugins`, в списке выбрать `Ontop ODBA Protege plugin` - тогда установится последняя стабильная версия плагина (на момент написания - 1.18). Более новый плагин можно скачать здесь. Его необходимо закинуть в директорию `/путь/до/protege/plugins`. Работа была проверена на версиях 1.18 и 3.0.0 beta-2.

Второй шаг в настройке: `JDBC-драйвер`. Для MySQL ссылка дана во введении. Для других СУБД есть отличный список, который находится тут. Далее нужно рассказать Protege, где этот драйвер лежит: `File -> Preferences -> JDBC Drivers`, кнопка `Add`. Заполните поля:

- Description: Connector/J ,
- Class Name: com.mysql.jdbc.Driver,
- Driver File (jar): /путь/до/файла/драйвера
- Последний шаг: настроить рабочее пространство. Window -> Tabs -> Ontop Mappings и Window -> Tabs -> Ontop SPARQL
## Пример маппингов 
```javascript
[MappingDeclaration] @collection [[
mappingId	urn:MAPID-b9a528b16b994750b5b109cedc765cb8
target		:Music-{id} a :Music ; :name {title} . 
source		select id, title from song

mappingId	urn:MAPID-b82991499ac64055b56e55b8505b96ce
target		:Album-{id} a :Album ; :AlbumName {name} ; :CreationYear {creation_year} . 
source		select id, title, creation_year from album

mappingId	urn:MAPID-a4f965f34ea6487586d15fc45a9c2258
target		:Album-{album_id} :contains :Music-{id} . 
source		select album_id, id from song
]]

[MappingDeclaration] @collection [[
mappingId	urn:MAPID-b5e528b16b994750b5b109cedc765cb8
target		:Music-{id} a :Music ; :name {name} ; :duration {duration} . 
source		select id, name, duration from music

mappingId	urn:MAPID-b82991499ac64055b56e55b8505b96ce
target		:Singer-{id} a :Singer ; :SingerName {name} ; :biography {biography} . 
source		select id, name, biography from singer

mappingId	urn:MAPID-a4f965f34ea6487586d15fc45a9c2258
target		:Singer-{singer_id} :perfomed :Music-{music_id} . 
source		select singer_id, music_id from musictosinger
]]

```



## Запуск и тестирование
Файлы с маппингами и онтологиями прилагаются. Для того, чтобы всё заработало, откройте в Protege файл `spotify_player.owl`. В рабочем пространстве перейдите на вкладку `Ontop Mappings -> Datasource manager` и проверьте, что все поля заполнены:
```
   Connection URL: jdbc:mysql://localhost/spotify_player`
   Database User: root`
   Database Password: 111`
   Driver class: com.mysql.jdbc.Driver`
   Нажмите на кнопку Test Connection, чтобы проверить соединение с базой.`
```
Если всё в порядке, можно запустить reasoner. Убедитесь, что в меню `Reasoner` выбран` Ontop <версия>` и нажмите `Start reasoner`.

После успешного запуска `reasoner'а` можно проверить работоспособность системы. Для этого перейдите на вкладку `Ontop SPARQL` и в поле `Query Editor` введите любой `SPARQL`-запрос, например:

```javascript
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/spotify-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

USE spotify_player;
SELECT * FROM song;
```


