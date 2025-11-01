#!/usr/bin/env bash

read -r -p "Введите целое число: " input

if [[ ! $input =~ ^[+-]?[0-9]+$ ]]; then
  echo "Некорректный ввод: требуется целое число."
  exit 1
fi

n=$((input))

if (( n > 0 )); then
  echo "Число положительное."
elif (( n < 0 )); then
  echo "Число отрицательное."
else
  echo "Число равно нулю."
fi

if (( n > 0 )); then
  echo "Счёт от 1 до $n:"
  i=1
  while (( i <= n )); do
    printf "%d " "$i"
    ((i++))
  done
  echo
fi