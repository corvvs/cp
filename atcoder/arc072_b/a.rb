# https://atcoder.jp/contests/abc059/submissions/4649758
X,Y = gets.split.map &:to_i
puts (X-Y).abs > 1 ? :Alice : :Brown