#!/bin/bash

function loadres(){

mhost="habr.com"

if ping -c1 "$mhost" &> /dev/null
then
notify-send -i $HOME/*/live-host/img/gdu-smart-healthy.png "Ваш хост $mhost" "Отвечает на запросы"
else
notify-send -i $HOME/*/live-host/img/gdu-smart-failing.png "Ваш хост $mhost" "Не отвечает на запросы"
fi



}



if !(dig google.com | grep REFUSED &>/dev/null)
then

loadres
else
notify-send -i $HOME/*/live-host/img/no-internet-pc.png "Вероятно отсутствует подключение" "К Иинтеренету"
fi




exit 0
