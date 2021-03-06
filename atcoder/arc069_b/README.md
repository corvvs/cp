# 問題

https://atcoder.jp/contests/abc055/tasks/arc069_b

# メモ

動物が輪ではなく直線上に並んでいる、つまり動物`1`と 動物`N`が隣り合っていないとする。\
動物の種類と回答をそれぞれ0,1に置き換える。つまり羊を0,狼を1とし、'o'を0,'x'を1と置き換える。\
すると、動物と回答の関係は下記の漸化式で表現できる:

`t[i-1] ^ t[i+1] ^ t[i] = s[i] for i = 2..N-1`

両辺で`s[i], t[i+1]`とのxorをとると、

`t[i-1] ^ s[i] ^ t[i] = t[i+1] for i = 2..N-1`

つまり`t[i-1], t[i], s[i]`がわかっていれば`t[i+1]`が計算できることになる。\
そこで、`t[1],t[2]`を適当に仮定した上で`t[i+1]`を順番に計算する。\
計算された`t`の妥当性は、「`t[N+1]`と`t[N+2]`」が`t[1],t[2]`に一致するかどうかで判断する。\
※`t[N+1] == t[1]`だけでは不十分(漸化式は2つ前の項も見るので)
