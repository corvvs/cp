# https://atcoder.jp/contests/arc023/submissions/4534597
R,C,D,*A = `dd`.split.map &:to_i
p (0...R*C).map{ |rc|
  i = rc/C; j = rc%C
  d = D - i - j
  d >= 0 && d%2 == 0 ? A[rc] : nil
}.compact.max
