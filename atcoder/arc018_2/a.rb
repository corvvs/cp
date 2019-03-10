# https://atcoder.jp/contests/arc018/submissions/4534671
N = gets.to_i
PS = (0...N).map{ gets.split.map &:to_i }
p (0...N-2).map{ |a|
  (a+1...N-1).map{ |b|
    (b+1...N).map{ |c|
      x1 = PS[b][0] - PS[a][0]
      y1 = PS[b][1] - PS[a][1]
      x2 = PS[c][0] - PS[a][0]
      y2 = PS[c][1] - PS[a][1]
      s2 = x1*y2 - x2*y1
      s2 == 0 ? 0 : 1 - s2 % 2
    }.inject(:+)
  }.inject(:+)
}.inject(:+)
