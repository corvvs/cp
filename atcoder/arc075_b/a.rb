# https://atcoder.jp/contests/abc063/submissions/4649157
N,A,B,*H = `dd`.split.map &:to_i
S = H.inject(:+)
D = A - B
p (1..S/B).bsearch{ |n|
  d = n*B
  H.inject(0){ |a,h| v = h-d-1; v = -1 if v < -1; a + (v == -1 ? 0 : v/D+1) } <= n
}
