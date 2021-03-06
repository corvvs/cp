# 問題

https://atcoder.jp/contests/abc011/tasks/abc011_4

原点`(0,0)`からスタートして、上下左右に等確率に`D`だけ移動することを`N`回繰り返した時、最終的に`(X,Y)`にいる確率を求めよ。

## 制約

- `1 <= N <= 1000`
- `1 <= D <= 1e9`
- `0 <= |X|,|Y| <= 1e9`

# メモ

まず、`X,Y`のうち一方でも`D`で割り切れない場合、どれだけジャンプしても`(X,Y)`にたどり着くことはない。

以下、`X,Y`は`D`で割り切れるものとし、`(S,T) = (|X/D|,|Y/D|)`を使って考える(絶対値を取ってよいのは対称性から)。\
これで、問題は「上下左右に等確率に1だけ移動することを`N`回繰り返した時、最終的に`(S,T)`にいる確率を求めよ」となる。

よってまず、`S+T < N`の場合、どれだけ効率よく飛んでも`(S,T)`にはたどり着けない。\
以下、`S+T >= N`とする。

`(S,T)`にたどり着くには、上に`S`回、右に`T`回に飛んだ上で、その後は上下・左右にそれぞれ同じだけ飛ぶことになる。\
よって、`N - S - T`は偶数でなければならない。

以下、`2M = N - S = T`とすると、ありうるジャンプ回数は、`k = 0..M`を用いて

- 上に飛ぶ回数: `S + k`
- 下に飛ぶ回数: `k`
- 右に飛ぶ回数: `T + M - k`
- 左に飛ぶ回数: `M - k`

と書けることになる。

従って、求める確率は、`(Σ[k=0..M]N!/(S+k)!/k!/(T+M-k)!/(M-k)!)/4^N`となる。

# ひとことで

大きな数は`log`で計算