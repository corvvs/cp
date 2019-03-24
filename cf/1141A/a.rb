N,M = gets.split.map &:to_i
if M % N > 0
  p -1; exit
  end
g = M / N
ans = 0
[2,3].each{ |d|
  while g % d == 0 do
    ans += 1
    g /= d
  end
}
p g == 1 ? ans : -1