# ・topコマンド
**概要：現在実行中のプロセスをCPU使用率が高いものから順に表示されるコマンド**
***
Ex)  
`top`  
`Processes: 368 total, 2 running, 366 sleeping, 1558 threads ` `17:43:38`  
`Load Avg: 1.55, 1.89, 1.94  CPU usage: 10.6% user, 4.19% sys, 85.74% idle`  
`SharedLibs: 233M resident, 60M data, 19M linkedit.`  
`MemRegions: 173283 total, 2628M resident, 76M private, 730M shared.`  
`PhysMem: 8108M used (2330M wired), 81M unused.`  
`VM: 3391G vsize, 1993M framework vsize, 58685104(128) swapins, 60997028(0) swapouts.`  
`Networks: packets: 44231771/48G in, 50524295/6911M out. Disks: 23712657/521G read, 12483951/380G written.`
`PID    COMMAND      %CPU TIME     #TH   #WQ  #PORT MEM    PURG   CMPRS  PGRP  PPID  STATE    BOOSTS            %CPU_ME
67806  com.apple.We 49.6 01:42.06 9     4    186   393M-  5516K- 214M   67806 1     sleeping *0[36152+]        0.00000
75355  top          16.0 00:01.85 1/1   0    26    8016K  0B     0B     75355 67960 running  *0[1]             0.00000
・
・
・
略`
***
* オプション

**-n)**  
"top -n 3"とすると、３回表示して終了する。

**-d)**  
"top -d 3"とすると、3秒間隔で更新をする。

**-pid)**  
"top -pid 10,20"とすると、プロセスIDが10と20のプロセスを表示する

**-U)**  
"top -U name"とすると、ユーザ「name」のプロセスを表示する
***
* 考察  
"top"だけで使用すると、かなりの頻度で更新をされるため、とても見にくい印象であるが、ユーザやプロセスIDなどで絞ることで表示される量が少なくなり、さらに、更新回数を指定すれば一定期間のリソース状況の確認ができ、更新が終われば、最終的な結果をじっくり見ることが出来る。
