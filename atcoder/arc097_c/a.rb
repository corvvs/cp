N = gets.to_i
balls = (0..1).map{ [] }
idx = (0..1).map{ {} }
(0...2*N).each{ |i|
  c,a = gets.split
  a = a.to_i
  ci = c == "B" ? 0 : 1
  balls[ci] << a
  balls[1 - ci] << 0
  idx[ci][a] = i
}

balls_larger_than = (0..1).map{ [] }
(0..1).each{ |c|
  bc = balls_larger_than[c]
  bcs = balls[c]
  (0..N).each{ |v|
    n = 0
    bc << bcs.map{ |b|
      r = n
      n += 1 if b > v
      r
    }
  }
}

dp = Array.new(N+1,10**15)
dp[0] = 0
i0 = idx[0]
i1 = idx[1]
b0 = balls_larger_than[0]
b1 = balls_larger_than[1]
(0..N).each{ |y|
  iy = i1[y]
  b1y = b1[y]
  (0..N).each{ |x|
    next if x == 0 && y == 0
    b0x = b0[x]
    w = 10**15
    if x > 0
      ix = i0[x]
      v = dp[x-1] + b0x[ix] + b1y[ix]
      w = v if v < w 
    end
    if y > 0
      v = dp[x] + b0x[iy] + b1y[iy]
      w = v if v < w
    end
    dp[x] = w
  }
}
p dp[-1]