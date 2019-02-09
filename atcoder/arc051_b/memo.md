# 問題概要

2つの正整数`A,B`に対して、再帰で実装されたユークリッドの互除法により最大公約数を求める際の再帰の深さを`D`とする。\
`D`が与えられるので、`A B`の例を1組出力せよ。

# 回答概要

3整数`x, y, z`が、`x > y, y > z, 2y > x`を満たすなら、`x - y == x % y`となる。\
このことから、フィボナッチ数列の計算過程がユークリッドの互除法の逆回しのようになる。

よって、`F[0] = 1, F[1] = 1, F[i+2] = F[i+1] + F[i]`とすると、
`(F[D+1], F[D])`が答えになる。