#!/usr/bin/env bash

echo "探索するディレクトリを指定してください"
read input_directory
if [ -z ${input_directory} ]; then
  input_directory="/Users/kouki"
fi

if [ ! -e ${input_directory} ]; then
  echo "正しいディレクトリを入力してください"
  exit 1;
fi

echo "権限の変更を3桁の数値で入力してください"
read input_authority_number
if [ -z ${input_authority_number} ]; then
  echo "数値を入力してください"
  exit 1;
fi
echo "権限を付与していきます"
find $input_directory -type f | xargs -n 10 chmod $input_authority_number
ls -l
echo "終了します"
