N,M = gets.split.map &:to_i
is = Array.new(N,0)
os = Array.new(N,0)
M.times {
  i,o = gets.split.map &:to_i
  is[i-1] += 1
  os[o-1] += 1
}

ans = 0
n = 0
(0...N).each{ |k|
  n += is[k]
  ans += 1 if n == M
  n -= os[k]
}
p ans