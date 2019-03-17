# https://atcoder.jp/contests/agc003/submissions/3373838
N = gets.to_i
h = {}
as = (0...N).map{ gets.to_i }
(0...(N+1)/2).each{ |i| a = as[2*i]; h[a] = (h[a] || 0) + 1 }
as.sort!
(0...(N+1)/2).each{ |i| a = as[2*i]; h[a] = (h[a] || 0) - 1 }
p h.values.reduce(0) { |a,b| a + [b,0].max }
