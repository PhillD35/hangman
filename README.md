# Виселица

### Описание

Игра Виселица. 

https://ru.wikipedia.org/wiki/Виселица_(игра)

Написана на Ruby 2.5.1

### Запуск

Bundle

````
bundle install
````

Запуск игры

````
bundle exec ruby main.rb
````

Создать новый список слов

````
bundle exec ruby main.rb -n
````

### Назначение файлов

**main.rb** - основной файл программы

**lib/game.rb** - логика игры

**lib/result_printer.rb** - выводит статус игры в консоль

**lib/words_generator.rb** - создаёт новый список слов. Слова берёт из толкового словаря Даля http://litmaster.net/index.php?book=3/

**lib/word_reader.rb** - вытягивает случайное слово из списка слов

**imagex/1.txt..7.txt** - псевдографика Виселицы
