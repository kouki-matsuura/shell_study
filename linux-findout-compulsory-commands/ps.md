# ・psコマンド
**概要：現在、Linux上で動作しているプロセスを確認することが出来る**
***
Ex)  
`MacBook-Pro:Users kouki$ ps`  
`  PID TTY           TIME CMD`  
`65503 ttys000    0:00.06 -bash`

Bashが動いていることが確認できる。
***
* オプション

**aオプション）**  
端末の操作のプロセスを表示  
`MacBook-Pro:Users kouki$ ps a`  
`PID   TT  STAT      TIME COMMAND`    
`65501 s000  Ss     0:00.17 login -pf kouki`  
`65503 s000  S      0:00.06 -bash`  
`66859 s000  R+     0:00.00 ps a`

**-xオプション）**  
現在、実行しているプロセスの表示  
`MacBook-Pro:Users kouki$ ps -x`  
  `PID TTY           TIME CMD`  
  `471 ??          0:04.84/System/Library/Frameworks/LocalAuthentication.framewo`  
  `478 ??         5:08.62 /usr/libexec/UserEventAgent (Aqua)`    
  `480 ??         5:17.34 /usr/sbin/distnoted agent`  
  `484 ??         2:08.60 /usr/libexec/knowledge-agent`
  `485 ??         0:46.44 /usr/libexec/lsd`
  `487 ??         9:08.28 /usr/libexec/trustd --agent`

**cオプション）**  
実行しているコマンド名を表示  
`MacBook-Pro:Users kouki$ ps c`  
  `PID   TT  STAT      TIME COMMAND`  
`65503 s000  S      0:00.07 -bash`

**uオプション）**  
メモリやCPUの使用率表示  
`USER    PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND`  
`kouki 65503   0.0  0.0  4308048   1116 s000  S    11:55AM   0:00.07 -bash`

これらのオプションを使うことで、今動かしているプロセスを監視し、異常な終了をした処理を調べることができ、killコマンドで処理を停止させることも可能となる。
最も適した方法として**「aux」**があり、a,u,xのオプションを組み合わせたものである。

Ex)
`MacBook-Pro:Users kouki$ ps aux`  
`USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND`  
`_coreaudiod        216   4.9  0.2  4401488  14516   ??  Ss    41220  483:53.83 /usr/sbin/coreau`  
`_windowserver      236   3.3  0.9  7867404  78996   ??  Ss    41220  606:16.51 /System/Library/`  
`kouki            66920   3.0  6.4 107274660 535908   ??  Ss   12:14PM   0:31.65 /System/Library/`  
`kouki            34581   2.5  0.9  5249064  78848   ??  S    水07PM  10:16.38 /S
・
・
・
略`
***
* 考察  
ここで、例えば、PID216番異常な動きをしていれば、
"Kill 216"で処理を強制終了させることが出来る。
また、psに「f」オプションをつけるとツリー表示になるため、UI的にとても監視がしやすくなる。
