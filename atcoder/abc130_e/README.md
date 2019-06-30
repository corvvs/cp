# 問題: ABC130E - Common Subsequence

https://atcoder.jp/contests/abc130/tasks/abc130_e

# メモ

`1 <= i <= N, 1 <= j <= M`について、\
`U(i,j) = 題意をみたす部分列のペアのうち、S側がS[i]、T側がT[j]で終わるようなものの数`

とすると、\
「題意をみたす部分列のペアのうち、`S`側が`S[i]`、`T`側が`T[j]`で終わるようなものの数」\
= 「題意をみたす部分列のペアのうち、`S`側が`S[i]`より前、`T`側が`T[j]`より前で終わるようなものの末尾に`S[i], T[i]`をそれぞれ付け加えたもの」\
であることがわかる。

これを漸化式として表現すると、`U(i,j) = Σ[i'<i,j'<j]U(i',j')`.\
空の列同士のペアは題意を満たすので、`U(0,0) = 1, U(i,0) = U(0,j) = j (i > 0, j > 0)`とすると、上の漸化式に従って`U(i,j)`を計算することができる。

これを真面目にやると`O(N^2M^2)`かかるが、２次元累積和として考えると`O(NM)`で計算できる。\
最終的な答えは`Σ[i=0..N,j=0..M]U(i,j)`.
