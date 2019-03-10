# 問題

https://atcoder.jp/contests/arc025/tasks/arc025_2

# メモ

添字は1-indexedとする。

左上角の座標が`(i,j)`, 右下角の座標が`(u,v)`であるような長方形(これを`(i,j)-(u,v)`と書く)の白黒濃度の合計が`O(1)`でわかれば、全体として`O(H^2W^2)`で計算できるはず。

`f(i,j) = 長方形(0,0)-(i,j)のチョコ濃度の総和`とする。ただし白チョコ濃度は正、黒チョコ濃度は負とする。\
これを使うと、`g(i,j,u,v) = 長方形(i,j)-(u,v)のチョコ濃度の総和 = f(u,v) - f(u,j-1) - f(i-1,v) + f(i-1,j-1)`と計算できる。\
`f(,)`自体の計算は、`f(i,j) = f(i-1,j) + f(i,j-1) - f(i-1,j-1) + d(i,j)`.ただし`d(i,j) = マス(i,j)のチョコ濃度 であり、 i = 0 or j = 0のときf(i,j) = 0とする。`。

# 感想

Rubyなので4TLE.

1. [初回提出](https://atcoder.jp/contests/arc025/submissions/4533754)
2. [配列参照をちょっと削る](https://atcoder.jp/contests/arc025/submissions/4533767)
3. [配列参照をさらに削る](https://atcoder.jp/contests/arc025/submissions/4533812)
4. [掛け算から足し算へ](https://atcoder.jp/contests/arc025/submissions/4533886)
5. [[AC]面積が大きいものからチェック](https://atcoder.jp/contests/arc025/submissions/4533967)

(Rubyでは)適切でない方針を無理に押し通した感がすごい。
