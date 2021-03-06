# 問題: ABC128 E - Roadwork

https://atcoder.jp/contests/abc128/tasks/abc128_e

# メモ

横軸が時刻`t`, 縦軸が座標`x`の平面上で、\
通行止め`i`を線分(`x = X[i] = const. S[i]-0.5 <= t <= T[i]-0.5`)、\
人`i`の動きを半直線(`x = t - D[i], x >= 0`)で表す。

すると、人`i`が止まる座標は、人`i`の半直線と交わる通行止め線分のうち最も`x`が小さいもの、となる(そのようなものがないこともある)。

このままでは少し見通しが悪いので、人半直線を垂直にするために剪断変形`t-x -> t`をかける。\
すると、
通行止め`i`は線分(`x = X[i] = const. S[i]-0.5-x <= t <= T[i]-0.5-x`)、\
人`i`は半直線(`t = D[i], x >= 0`)となる。\
よって、各人について、「真上」にある通行止め区間のうち最も`x`が小さいものを求めればよく、\
これはimos法で計算できる。

# 感想

考察はシンプルだが実装は大変、というかRubyだとTLEする・・・
