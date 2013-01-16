md5app
======

Сохраняет md5 суммы файлов проекта в дирректорию log/md5app/

### Установка

```ruby
gem 'md5app'
```

### Запуск

```sh
$ rake md5app:run
```
### Настройки

Есть возможность выборочного игнорирования определенных файлов и дирректорий
аналогично .gitignore

### Пример .md5ignore 

```
.git
log
public/assets
public/uploads
tmp
```
### Запуск по расписанию

Рекомендуется использовать [whenewer gem](https://github.com/javan/whenever).
