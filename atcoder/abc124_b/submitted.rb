N,*H = `dd`.split.map &:to_i
m = 0
ans = 0
H.each{ |h|
  ans += 1 if m <= h
  m = [m,h].max
}
p ans