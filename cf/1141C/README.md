# 問題: Codeforces Round #547 (Div. 3) C. Polycarp Restores Permutation

https://codeforces.com/contest/1141/problem/C

整数`n`と、`1..n`の順列`p[i]`の**隣接要素の差**`q[i] = p[i+1] - p[i] (i=1...N)` が与えられるので、元の順列`p[i]`を復元せよ。\
validな順列が存在しない場合は`-1`を出力せよ。

# メモ:

`p[1] = 0`(右辺はなんでもよい)と仮定すると、

```
p[2] = q[1] + p[1]
p[3] = q[2] + p[2]
...
p[i+1] = q[i] + p[i]
...
p[N] = q[N-1] + q[N-1]
```

と帰納的に`p[i]`が得られる。\
これら`p[i]`が:

- `max{ p[i] } - min{ p[i] } == N-1`
- `p[i]`に重複がない

を満たすなら、`p[i]`の最小値を1に持ち上げたものが答え。\
具体的には`m = min{ p[i] }`として`p[i] - m + 1`が答え。
