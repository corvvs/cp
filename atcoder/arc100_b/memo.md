# 問題

https://atcoder.jp/contests/abc102/tasks/arc100_b

整数列を3箇所で切り、4つの空でない連続する部分列に分けた時、「『各部分列の要素の総和』の最大値と最小値の差」を最小化せよ。

# メモ

[解説](https://img.atcoder.jp/arc100/editorial.pdf)とほぼ同じ。\
ただし「左(右)の切れ込み」を求めるのに二分探索を使ったため、計算量は`O(NlogN)`に悪化している。
