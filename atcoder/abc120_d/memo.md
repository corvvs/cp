# 問題

https://atcoder.jp/contests/abc120/tasks/abc120_d

# メモ

時間を逆回しにして、橋`M`から橋`1`まで順に橋が架かっていくと考えると、\
「 橋`i`が架かる直前の不便さ-橋`i`が架かった直後の不便さ」=「橋`i`が架かることにより行き来が可能になる島の数」となる。

そこで、UnionFindにより行き来できる島の集合を管理しておき、\
橋`i`が異なる集合同士を繋ぐ時に、繋がれる2つの集合のサイズの積だけ不便さを増やす。

# ポイント

[解説](https://img.atcoder.jp/abc120/editorial.pdf)より:

> グラフから辺を削除していくのは難しいことが多いので