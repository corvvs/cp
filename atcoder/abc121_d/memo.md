# 問題

https://atcoder.jp/contests/abc121/tasks/abc121_d

# メモ

`g(x) = 1..xのXOR`とすると、`f(A,B) = g(A-1) ^ g(B)`と書けるので、
`g(x)`を求めれば良い。

普通にやっていると間に合わないので、桁ごとに行う。

`1..x`のうち2進`i`桁目(1-indexed)が1であるものの数は\
`(x+1) / (2**i) * (2**(i-1)) + [(x+1) % (2**i) - (2**(i-1)), 0].max`\
で与えられるので、これを必要な桁数分行えばよい。
