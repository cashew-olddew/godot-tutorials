#!/bin/sh
echo -ne '\033c\033]0;CashewClicker\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CashewClicker.x86_64" "$@"
