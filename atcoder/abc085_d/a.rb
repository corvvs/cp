# https://atcoder.jp/contests/abc085/submissions/4658394
N,h = gets.split.map &:to_i
As,Bs = (0...N).map{ gets.split.map &:to_i }.transpose
A = As.max
B = Bs.select{ |b| b >= A }.sort.reverse
ans = 0
B.each{ |b|
  h -= b
  ans += 1
  break if h <= 0
}
p ans + (h > 0 ? (h-1)/A + 1 : 0)
