#!/bin/sh
echo "check $1.lock"
if [ ! -f "$1.lock" ]; then
  touch "$1.lock"
  twspace_dl -U "https://twitter.com/$1" -o "[%(creator_screen_name)s]-%(title)s|%(start_date)s"
  rm "$1.lock"
fi
