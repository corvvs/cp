# https://atcoder.jp/contests/abc094/submissions/4651080
n,*a = `dd`.split.map &:to_i
a.sort!
m = a[-1]
puts [m, a[0...-1].max_by{ |a| [(m-a).abs,a].min }] * " "