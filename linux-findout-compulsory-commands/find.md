# ・findコマンド
**概要：ファイルを検索するコマンド**
***
Ex)  
`MacBook-Pro:linux-findout-compulsory-commands kouki$ find *`  
`curl.md`  
`find.txt`  
`grep.md`  
`ps.md`  
`tail.md`  
`top.md`
***  
* オプション

**-name)**  
ファイルやディレクトリの名前を一部のみで指定できる。  

**-atime)**  
指定した日数にアクセスされたファイルを検索する。当日のものを検索したい時は0を指定。2日以内のものなら-2と指定。

**-mtime)**  
指定した日数に変更が行われたファイルを検索する。こちらも当日の場合は0を指定。前日なら1を指定。

**-anewer)**  
指定のファイルよりも後にアクセスしたファイルを検索。

**-newer)**  
指定のファイルよりも後に更新をしたファイルを検索。

**-empty)**  
容量がない空のファイルを検索。

**-size)**  
指定の容量があるファイルを検索。

**-perm)**  
特定のユーザ、権限でファイルを検索。
***
* 考察  
findコマンドはgrepのファイル特化バージョンのようなイメージである。ファイルやディレクトリの検索に対して、かなり詳細に調べることが出来る。特に、オプションは重要なものばかりで「-newer」を使えば、指定のファイルを原点にどのファイルが変更されたかを知ることが出来る。他には、「-empty」を使うことで、コンピュータの中にあるただ作成された中身のないファイルを抽出でき、削除することでファイルの整理が可能となる。