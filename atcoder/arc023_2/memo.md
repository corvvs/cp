# 問題

https://atcoder.jp/contests/arc023/tasks/arc023_2

# メモ

`(1,1)`から`(i,j)`までちょうど`D`回の移動で到達できるかどうかは、

- まず最短経路で移動
- あまった回数は適当に反復横跳びして過ごす

が可能かどうかを見ればよい。\
最短経路で移動可能かどうかは`i-i + j-1 <= D`で、\
余った回数を反復横跳びで消費可能かどうかは`(D - (i+1) - (j+1)) % 2 == 0`で判定できる。