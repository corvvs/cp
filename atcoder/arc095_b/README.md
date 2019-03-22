# 問題

https://atcoder.jp/contests/abc094/tasks/arc095_b

# メモ

`comb(n,r)`について:

- `n`を固定すると、`comb(n,r)`を最大にする`r`は
  - `r = n/2` (`n`が偶数)
  - `r = (n+1)/2 and (n-1)/2` (`n`が奇数)
- `r >= 0`のとき、`comb(n+1,r) = comb(n,r) * (n+1) / (n-r+1) >= comb(n,r)`
  - 等号は`r = 0`のときのみ
  - [参考](https://ja.wikipedia.org/wiki/%E3%83%91%E3%82%B9%E3%82%AB%E3%83%AB%E3%81%AE%E4%B8%89%E8%A7%92%E5%BD%A2#/media/File:Pascal_triangle.svg)

が成り立つ。

これより、`m = max{ a[] }`とすると、\
任意の`i`について`comb(m,r) >= comb(a[i],r)`となるので、`n = m`として損がない。\
あとは、`a[]`のうち`n/2`に最も近い(`m`以外の)要素を`r`にすればよい。\
計算量は`O(N)`.
