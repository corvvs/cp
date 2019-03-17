# Ruby小技集

あんまり書けることがない

## `p`は`puts`より遅い

考えてみれば当たり前だが・・・

```
$ time ruby -e 'N = 1000000; N.times{ p rand(100) }' > /dev/null 

real    0m4.328s
user    0m3.364s
sys     0m0.914s
$ time ruby -e 'N = 1000000; N.times{ puts rand(100) }' > /dev/null 

real    0m0.805s
user    0m0.724s
sys     0m0.066s
$ 
```

`N`が小さいとそんなに差は出ないのだが、`10**5`くらいだと結構効く。

例: [ARC033C データ構造](https://atcoder.jp/contests/arc033/tasks/arc033_3)に対する

- [TLEコード](https://atcoder.jp/contests/arc033/submissions/4577708)
- [ACコード](https://atcoder.jp/contests/arc033/submissions/4578458)

※`if`と`case`の差は全くなかった。

## 多次元配列参照は全力で避ける

2次元,3次元といった多次元配列の2次元目以降へのアクセスは可能な限り避ける:

```rb
# before
(0...N).each{ |i|
  (0...N).each{ |j|
    puts a[i][j]
  }
}

# after
(0...N).each{ |i|
  row = a[i]
  (0...N).each{ |j|
    puts row[j]
  }
}
```

行列積はサイズによっては転置してしまった方が早かったり:

```rb
# before
(0...N).each{ |i|
  rowa = a[i]
  (0...N).each{ |j|
    (0...N).each{ |k|
      c[i][j] = rowa[k] + b[k][j]
    }
  }
}

# after
b = b.transpose
(0...N).each{ |i|
  rowa = a[i]
  (0...N).each{ |j|
    colb = b[j]
    (0...N).each{ |k|
      c[i][j] = rowa[k] + colb[k]
    }
  }
}
```

