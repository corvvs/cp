H,N = gets.split.map &:to_i
D = gets.split.map &:to_i
ss = [0]
(1..N).each{ |i|
  d = D[i-1]
  ss << (ss[-1] + d)
  if ss[-1] + H <= 0
    p i; exit
  end
}

if ss[-1] >= 0
  p -1; exit
end

td = ss[-1]
t = nil
k = (0..H/(-td)).bsearch{ |n|
  h0 = H + n*td
  h = h0
  j = 0
  ss.each{ |s|
    h = h0 + s
    break if h <= 0
    j += 1
  }
  t = j if h <= 0
  h <= 0
}
p N*k + t
