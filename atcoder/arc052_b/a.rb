# https://atcoder.jp/contests/arc052/submissions/4541505
N,Q = gets.split.map &:to_i
Corns = (0...N).map{ x,r,h = gets.split.map &:to_f; [x,r,x+h,h] }
Q.times {
  a,b = gets.split.map &:to_i
  p Corns.map{ |x1, r, x2, h|
    xa = [[a, x1].max, x2].min
    xb = [[b, x1].max, x2].min
    ra = r * (x2 - xa) / h
    rb = r * (x2 - xb) / h
    (ra**2) * (x2 - xa) - (rb**2) * (x2 - xb)
  }.inject(:+) * Math::PI / 3
}
