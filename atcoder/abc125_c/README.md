# 問題: ABC125 C - GCD on Blackboard 

https://atcoder.jp/contests/abc125/tasks/abc125_c

# メモ

要素`A[i]`を書き換えるとした場合、書き換え後の値は「`A[i]`**以外の**要素のGCD」にすると損がない。\
これはつまり`A[i]`を無視していることに等しく、書き換え後のGCDは「`A[i]`**以外の**要素のGCD」となる。

「`A[i]`**以外の**要素のGCD」は\
`gcd(gcd(A[1], ..., A[i-1]), gcd(A[i+1], ..., A[N]))`\
と書ける。

数列`G1[i] = gcd(A[1], ..., A[i])`および\
数列`G2[i] = gcd(A[i], ..., A[N])`はいずれも`O(Nlog(max(A)))`で計算できる(ただし`gcd() = 0`とする)。

よって、\
`gcd(gcd(A[1], ..., A[i-1]), gcd(A[i+1], ..., A[N]))`の`i=1..N`に関する全探索は\
前処理と本計算いずれも`O(Nlog(max(A)))`で実行できることになる。