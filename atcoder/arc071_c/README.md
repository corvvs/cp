# 問題: ARC071 E - TrBBnsformBBtion

https://atcoder.jp/contests/arc071/tasks/arc071_c

# メモ

- `AB`,`BA`はいずれも`AAA`,`BBB`に変換できる
- `AAA`,`BBB`はいずれも`AB`,`BA`に変換できる
- `A`の隣には`AAA`,`B`の隣には`BBB`を任意に生成できる

以上から、部分文字列`AB`, `BA`, `AAA`, `BBB`は無視できることがわかる。\
そこでこれらの文字列を消せるだけ消していくと、どのような文字列も

- `A`
- `BB`
- `B`
- `AA`
- 空文字列
  - は都合が悪いので、一歩手前の`AAA`

のいずれかに変換できる。

`BB`は`BB -> AAAA -> A`という手順で`A`に変換でき、`AA`も同様に`B`に変換できるので、結局どのような文字列も

- `A`
- `AA`
- `AAA`

にいずれかに還元できることになる。

さて、文字列の**スコア**を「`A`の数 - `B`の数」で定義すると、1回の変換でスコアは±3だけ変化する。\
つまりスコアを3で割った余りは不変量になる。\
`A`, `AA`, `AAA`のスコアを3で割った余りはすべて異なるので、これらは相互の変換が不可能である。

よって、変換元と変換先の文字列が`A`, `AA`, `AAA`のうち同じ文字列に還元できれば`YES`, そうでなければ`NO`が答えになる。\
還元先の文字列については、直接求めるより文字列のスコアを累積和で計算した方が早い。