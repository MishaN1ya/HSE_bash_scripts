#!/usr/bin/env bash

say_hello() {
  local name="$*"  
  echo "Hello, $name"
}

sum() {
  local a="$1" b="$2"
  echo $(( a + b )) 
}

read -r -p "Введите имя: " name
say_hello "$name"

read -r -p "Введите первое целое число: " a
read -r -p "Введите второе целое число: " b

if [[ ! $a =~ ^[+-]?[0-9]+$ || ! $b =~ ^[+-]?[0-9]+$ ]]; then
  echo "Ошибка: нужны целые числа."
  exit 1
fi

res=$(sum "$a" "$b")
echo "Сумма $a и $b = $res"