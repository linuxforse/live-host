#!/bin/bash

#Функция посылает ping запрос к хосту указанному в переменной mhost
function loadres(){

#Необходимый адрес хоста можно указать прямо в командной строке в качестве аргумента в виде: myscript myhost.com
if [ -n "$1" ]
then
mhost=$1
else
#Вместо "mysite.com" укажите адрес необходимого хоста
mhost="mysite.com"
fi

if ping -c1 "$mhost" &> /dev/null
then
#Вместо "$HOME/*/live-host/" укажите свой (правильный) путь к иконкам. Без иконок скрипт тоже будет правильно работать.
notify-send -i $HOME/*/live-host/img/gdu-smart-healthy.png "Ваш хост $mhost" "Отвечает на запросы"
else
notify-send -i $HOME/*/live-host/img/gdu-smart-failing.png "Ваш хост $mhost" "Не отвечает на запросы"
fi


}
#Проверяем наличие доступа к сети Интернет
if !(dig google.com | grep REFUSED &>/dev/null)
then

loadres $1
else
notify-send -i $HOME/*/live-host/img/no-internet-pc.png "Вероятно отсутствует подключение" "К Иинтеренету"
fi

exit 0
