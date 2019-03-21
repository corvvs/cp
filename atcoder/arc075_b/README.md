# 問題

https://atcoder.jp/contests/abc063/tasks/arc075_b

# メモ

回数を決め打ちして二分探索する。

まず、魔法の効果を:

- 全ての魔物に`B`ダメージ
- 狙った魔物には追加で`A-B`ダメージ

と読み換える。

魔法を唱える回数を`n`回とすると、まず全ての魔物に`n*B`のダメージが入るので、
体力から`n*B`を引いておく。

その上で、残り体力が正の魔物に対して`A-B`ダメージを合計`n`回以下与えることで全滅させられるかどうかをチェックする。\
これは、残り体力が正であるような全ての魔物について`(残り体力-1)/(A-B)+1`の総和を取り、それが`n`以下であるかを見ればよい。\
計算量は`O(Nlog(S/B))`, ただし`S = Σh`.