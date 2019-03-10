# https://atcoder.jp/contests/arc020/submissions/4534360
N,C,*A = `dd`.split.map &:to_i
ans = C*N
(1..10).each{ |x|
  (1..10).each{ |y|
    next if x == y
    v = (0...N).reduce(0){ |a,i| c = i%2 == 0 ? x : y; a + (A[i] == c ? 0 : C) }
    ans = v if v < ans
  }
}
p ans
