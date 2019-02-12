# 問題

https://atcoder.jp/contests/abc078/tasks/arc085_b

# メモ

Xさんは必ずカードを引くので、`Z`の値は無意味。

(以下、解説よりマイルドな解法)

まず、`A`の先頭に`W`を挿入する(`|A|=N+1`)。その上で、\
`dp[player][i] = (プレイヤーplayerの**対戦相手が**i番目の札までを取った時に得られる、プレイヤーplayerにとっての最良スコア)`\
とすると、以下の要領で`dp`を再帰的に決めることができる:

- `player == X`のとき
  - `dp[X][i] = max( max{ dp[Y][k] | k = i+1...N }, |A[i] - A[N]| )`
- `player == Y`のとき
  - `dp[Y][i] = min( min{ dp[X][k] | k = i+1...N }, |A[i] - A[N]| )`

`dp[X][0]`が答えになる。計算量は`O(N^2)`.
