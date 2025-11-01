#!/usr/bin/env bash

target="${1-}"

echo "Список объектов в текущей директории с типом:"
for name in * .*; do
  [[ "$name" == "." || "$name" == ".." ]] && continue
  if   [[ -L "$name" ]]; then type="симлинк"
  elif [[ -d "$name" ]]; then type="каталог"
  elif [[ -f "$name" ]]; then type="файл"
  elif [[ -p "$name" ]]; then type="именованный канал"
  elif [[ -S "$name" ]]; then type="сокет"
  elif [[ -b "$name" ]]; then type="блочное устройство"
  elif [[ -c "$name" ]]; then type="символьное устройство"
  else type="неизвестно"; fi
  printf '%-40s %s\n' "$name" "$type"
done

echo
if [[ -z "${target}" ]]; then
  echo "Передай имя файла как аргумент, если хочешь, чтобы я проверил его наличие"
else
  echo "Проверим наличие файла:"
  [[ -e "$target" ]] && echo "Файл $target найден" || echo "Файл $target отсутствует"
fi

echo
echo "Список объектов в текущей директории с правами доступа:"
for f in * .*; do
  [[ -e "$f" ]] || continue
  [[ "$f" == "." || "$f" == ".." ]] && continue
  perms=$(stat -c '%A' -- "$f")
  printf '%-40s %s\n' "$f" "$perms"
done