N,m = gets.split.map &:to_i
AB = (0...N).map{ gets.split.map &:to_i }.sort
ans = 0
AB.each{ |a,b| 
  c = [b,m].min
  ans += a * c
  m -= c
  break if m == 0
}
p ans