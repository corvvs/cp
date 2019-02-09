# 問題

https://atcoder.jp/contests/abc116/tasks/abc116_d

# メモ

0. ネタは`T`種類あるとする
1. 皿をおいしさ降順にソート
2. まず先頭から`K`個取り、スコアを計算する。この時のネタの種類数を`X`とする。
3. ↑で取ったネタを、末尾から順に「ネタの種類数を減らさないように」外し、新しいネタを加えてスコアを計算する。
  - このプロセスでは、ネタの種類数は毎回1ずつ増えていくことになる
4. スコアの最大値を答えとする。