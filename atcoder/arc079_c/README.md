# 問題

https://atcoder.jp/contests/arc079/tasks/arc079_c

# メモ

`N <= 50`なので、10000回程度はRubyでも余裕でシミュレーションできる。\
そこで、10000回で終わらなかった場合のみ真面目に考えることにする。

まず最初に`a[i] <- a[i] - (N-1)`と変換し、\
問題を「数列`a[]`の最大値が0以下になるまでに必要な操作回数を求める」に言い換える。

まず、「初期状態における`a[]`の最小要素」(初期最小要素)が最大要素になるまでの操作回数を求める。\
1回の操作により、(その時点での)最大要素とその他の要素の差は、高々`N+1`だけ縮まる。\
よって、ある要素`a[i](i = 1...N)`が初期最小要素`a[0]`を下回るまでの操作回数は\
`(a[i]-a[0])/(N+1) + 1`回となる。

初期最小要素が最大要素になると、以後`max{ a[] } - N <= min{ a[] } + 1`が常に成り立つ。\
つまり、操作1回ごとに最大要素が最小要素になることを繰り返すようになるので、計算が非常に容易になる。\
要素の順序は周期`N`でループし、ループ1セットにつき全要素が1ずつ減るので、\
最小要素がゼロになるまでこれを繰り返す。\
こうなると、`max{ a[] } - N <= min{ a[] } + 1`より、`max{ a[] } <= N + 1`なので、あとはシミュレーションで十分間に合う。