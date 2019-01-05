# 問題概要

https://atcoder.jp/contests/code-thanks-festival-2018/tasks/code_thanks_festival_2018_e

# 回答過程

小さい数字から順に消していくとしてよい。

消していく過程を考えると、その時残っている最小の数字は偶数個でなければならない。

`dp[i][j] = [iより大きな数字が無く、i未満の数字が全て消されている状態で、数字iがj個ある場合の数(mod 1000000007)]`とすると、\
`0 <= k <= j`について、`j-k <= a[i]`であれば、`dp[i-1][2k]`は`dp[i][j]`に寄与する。

