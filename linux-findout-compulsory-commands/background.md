# ・&コマンド
**概要：バックグラウンド実行をするためのコマンド**
***
* シェルスクリプト  
`(sleep 5; echo "5s経過") &`  
`(sleep 6; echo "6s経過") &`  
`(sleep 7; echo "7s経過") &`  
`jobs`  

* 実行結果  
`MacBook-Pro:Shellscripts kouki$ bash forward.sh`  
`[1]   Running                 ( sleep 5; echo "5s経過" ) &`  
`[2]-  Running                 ( sleep 6; echo "6s経過" ) &`  
`[3]+  Running                 ( sleep 7; echo "7s経過" ) &`  
`MacBook-Pro:Shellscripts kouki$ 5s経過`  
`6s経過`  
`7s経過`
***
* 考察  
5秒が経つまでは、他のコマンドも受け付ける状態になっていたため、ちゃんとバックグランドで動いていることが認識できた。
利用例として、結果を得るまでに時間がかかるプログラムなどがある。そのプログラムが動いている間、作業ができないとかなり効率が落ちてしまう。なので、そのプログラムをバックグラウンドで作業させ、並行して、自分の他の作業に手をつけることが出来る。
