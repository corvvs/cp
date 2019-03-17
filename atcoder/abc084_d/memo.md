# 問題

https://atcoder.jp/contests/abc084/tasks/abc084_d

# メモ

(復習)

`f(x) = x以下の「2017に似た数」の総和`が早く計算できれば、`f(r) - f(l-1)`が答えになる。

計算自体は`f(1) = 0`として`f(x) = f(x-1) + (xが「2017に似た数」 ? 1 : 0)`と求めることができるので、これを必要なだけ前計算しておく。