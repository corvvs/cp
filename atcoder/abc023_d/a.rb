# https://atcoder.jp/contests/abc023/submissions/4345301
N = gets.to_i
BS = (0...N).map{ gets.split.map &:to_i }

Hmin = BS.map{ |h,s| h + s*(N-1) }.min
Hmax = BS.map{ |h,s| h + s*(N-1) }.max

p (Hmin..Hmax).bsearch{ |h0|
  ts = BS.map{ |h,s| (h0 - h)/s }.sort
  (0...N).all?{ |t| t <= ts[t] }
}
