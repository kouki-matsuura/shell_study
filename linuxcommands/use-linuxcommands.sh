#!/bin/bash
set -e
echo "ディレクトリ作成:[mkdir]   || ファイル作成:[touch]"
echo "どちらかを選択してください"
read COMMAND
if [ ${COMMAND} != mkdir ] && [ ${COMMAND} != touch ]; then
  echo "正しいコマンドを入力してください"
  exit 1;
fi

echo "名前を決めてください"
read NAME
case "$NAME" in
  [a-z0-9_-]* )
    if [ $COMMAND == mkdir ]; then
      echo "ディレクトリ名が指定されました"
    else
      echo "ファイル名が指定されました"
    fi
    echo "配置したいディレクトリを入力してください(空白の時はカレントディレクトリとなる)"
    ;;
  * )
    echo "ピリオドなし、正規表現"[a-z0-9_-]*"のルールで命名してください"
    ;;
esac

read DIRECTORY
if [ -z "$DIRECTORY" ]; then
  DIRECTORY=$(cd $(dirname $0); pwd)
fi

if [[ ! -d ${DIRECTORY} ]]; then
  echo "正しいディレクトリを入力してください"
  exit 1;
fi

cd --  $DIRECTORY
$COMMAND $NAME
echo "終わりました"
