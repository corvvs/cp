# 問題: Chokudai SpeedRun 002 I - カツサンドくん β

https://atcoder.jp/contests/chokudai_S002/tasks/chokudai_S002_i

# メモ

食べ物`i`が食べ物`j`に勝つ(=引き分けも負けもしない)条件は

`ceil(A[i] / B[j]) > ceil(A[j] / B[i])` - [X]

ここで両辺の`ceil`を取り去った条件を考えてみると、

`A[i] / B[j] > A[j] / B[i]` - [Y]

これは、(`ceil`の広義単調性により)条件[X]の必要条件となっている。\
この[Y]をもう少し変形して:

`A[i]B[i] > A[j]B[j]` - [Z]

この形は添え字が一方の辺にまとまっているので容易にチェックできる。\
言い換えると、積`A[i]B[i]`が単独トップになる食べ物が存在するならそれが最強候補となる。\
(単独トップがいない場合はその時点で終了)

ただし最強**候補**なので、実際に最強であることをきちんと確認する必要がある。

