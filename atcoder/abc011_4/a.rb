# https://atcoder.jp/contests/abc011/submissions/4080379
N,D,X,Y = `dd`.split.map &:to_i

if X.abs % D > 0 || Y.abs % D > 0
  p 0; exit
end

S,T = X.abs/D,Y.abs/D

if S+T > N
  p 0; exit
end

if (N - S - T) % 2 == 1
  p 0; exit
end

M = (N - S - T)/2

p (0..M).reduce(0){ |a,k|
  nn = 0.0
  nn = (1..N).reduce(nn){ |a,b| a + Math.log(b / 4.0) }
  [S+k, k, T+M-k, M-k].each{ |x|
    nn = (1..x).reduce(nn){ |a,b| a - Math.log(b.to_f) }
  }
  a + Math.exp(nn)
}