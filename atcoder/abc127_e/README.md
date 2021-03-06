# 問題: ABC127 E - Cell Distance

https://atcoder.jp/contests/abc127/tasks/abc127_e

# メモ

コスト = 全てのコマの2つ組のマンハッタン距離の総和 なので、\
全ての**マス**の2つ組のマンハッタン距離の総和を`V`とおく。

`NM == K` の場合は答えは自明(`V`)なので、以下`NM > K` として考える。

(`comb(,)`は二項係数を表すものとする)\
ありうる配置は `comb(NM,K)` 通り。\
そのうち、あるマス`x`にコマが置かれている配置は`comb(NM-1, K-1)`通り.\
さらに、`x`でない別のマス`y`にもコマが置かれている配置は`comb(NM-2, K-2)`通り.\
よって、答えは`V * comb(NM-2, K-2)`.

## `V`の計算方法

縦と横に分ける。

縦に`N-1`離れているマスの組み合わせは`1M^2`通り。\
縦に`N-2`離れているマスの組み合わせは`2M^2`通り。\
縦に`N-3`離れているマスの組み合わせは`3M^2`通り。\
...\
縦に`N-i`離れているマスの組み合わせは`iM^2`通り。\
...\
縦に`1`離れているマスの組み合わせは`(N-1)M^2`通り。

よって、縦の総和は`(Σ[i=1..N-1]i*(N-i))M^2`\
横も同様。



