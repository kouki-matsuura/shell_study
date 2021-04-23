# ・curlコマンド
**概要：様々なプロトコルを使って、データ転送ができるコマンドである。**
***
Ex)  
`MacBook-Pro:linux-findout-compulsory-commands kouki$ curl https://www.yahoo.co.jp`  
`<!DOCTYPE html><html lang="ja"><head><meta charSet="utf-8"/><meta http-equiv="X-UA-Compatible"   content="IE=edge,chrome=1"/><title>Yahoo! JAPAN</title><meta name="description" content="あなたの毎日をアップデートする情報ポータル。
・
・
略`

curl ${URL} と打つだけでURL先のプログラムをコンソールに表示させることが出来る。
***
* オプション  

**-X)**  
 `curl -X POST "https://www.yahoo.co.jp"`  
好きなリクエストメソッドを指定することが可能となる。何も指定しない時は、GETになるが、今回はPOSTメソッドにした。

**-v)**  
`curl -v  "https://www.yahoo.co.jp"`  
HTTP通信の詳細を出力してくれるオプション。

**-o)**  
`curl -o test.txt "https://www.yahoo.co.jp"`  
oオプションを利用すると、指定のファイルに結果を写してくれる。標準出力としては表示されなくなる。

**-I,--head)**  
`curl -I "https://www.yahoo.co.jp"`  
レスポンスヘッダのみを取得できる。
***
* 考察

その他、様々なオプションがあるが、僕は「-v」がとても良いと感じる。これを利用すれば、しっかりと通信されているのか、レスポンスは返ってきているのかを確認することができ、デバッグには最適だと感じる。
