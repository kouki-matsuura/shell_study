#!/bin/bash

display-usage () {
  echo "usage: ./convenient-command.sh [DIRECORY] [ COMMENT | BLANK ]"
　exit 1;
}

if [ -z $1 ] || [ -z $2 ]; then
  display-usage
fi
if [ ! -e $1 ]; then
  echo "正しいディレクトリを入力してください"
  exit 1;
fi

case $2 in
  "COMMENT")
  result=(`grep -l '^\s*#' $1/* | xargs basename`)
  for file in "${result[@]}"; do
    sed -i .bak '/^#/d' $file
  done
  ;;
  "BLANK")
  result=(`grep -l '/^$/d' $1/* | xargs basename`)
  for file in "${result[@]}"; do
    sed -i .bak '/^$/d' $file
  done
  ;;
  *)
  display-usage
esac

if [ $? -eq 0 ]; then
  echo "該当ファイル数：${#result[@]}"
  echo "処理が正常に終わりました"
fi
