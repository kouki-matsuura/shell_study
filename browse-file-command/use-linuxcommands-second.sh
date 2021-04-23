#!bin/#!/usr/bin/env bash
echo "探しているファイルがあるディレクトリを入力してください(何も入力されない時はカレントディレクトリとなります)"
read DIRECTORY

#入力がない時は、カレントディレクトリを取り出し格納
if [ -z "$DIRECTORY" ] ; then
  DIRECTORY=$(cd $(dirname $0);pwd)
fi

if [[ ! -d ${DIRECTORY} ]]; then
  echo "正しいディレクトリを入力してください"
  exit 1;
fi

echo "このディレクトリに存在するファイル一覧です"
cd ${DIRECTORY} && ls *.txt

echo "閲覧したいファイル名を入力してください"
read FILENAME

if [[ ! -f ${FILENAME} ]]; then
  echo "正しいファイル名を入力してください"
  exit 1;
fi
#指定のファイルの行数を格納
FILELINES=$(wc -l <${FILENAME})
#行数がない空のテキストファイルのための処理
if [[ $FILELINES -eq 0 ]]; then
  echo "空のファイルです"
  exit 1;
fi

echo "閲覧したい行数を1~"${FILELINES}"で入力してください（何も入力されない時は1行目を表示します。また、最終行より大きい行数を選ぶと、最終行を表示します。）"
read LINE

if [ -z "$LINE" ]; then
  LINE=1
fi

if [[ ! $LINE =~ [1-9]|[1-9]+[0-9] ]]; then
  echo "正しく入力してください"
  exit 1;
fi

if [[ $LINE -gt $FILELINES ]]; then
  LINE=$FILELINES
fi

cat ${FILENAME} | sed -n $LINE"p"

for i in `seq 10000`
do
  IFS= read -r -n1 -s char
  if [[ $char == $'\x1b' ]]; then
    read -r -n2 -s rest
    char+="$rest"
  fi

  case $char in
        #上矢印
    $'\x1b\x5b\x41')
      if [ $LINE != 1 ]; then
        echo $((--LINE))"行目"
        cat ${FILENAME} | sed -n $LINE"p"
      fi
      ;;
        #下矢印
    $'\x1b\x5b\x42')
      if [ $LINE != $FILELINES ]; then
        echo $((++LINE))"行目"
        cat ${FILENAME} | sed -n $LINE"p"
      fi
      ;;
    "q")
      echo "終了します"
      break ;;
      *)
      echo "↑キーで１つ前の行に↓キーで１つ後の行に写ります。終了時はqと押してください"
      ;;
  esac
done
