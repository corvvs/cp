T,*A = `dd`.split.map(&:to_i)
M = A.max
Mod = 1e9.to_i+7
dp = Array.new(2*M, 0)
(0..A[0]).each{ |i| dp[i] = 1 }
qp = Array.new(2*M, 0)
ans = 0
A[1..-1].each{ |a|
  ans += dp[1]
  qp.fill(0)
  (0..a).each{ |i|
    qp[i] = 1
  }
  #p dp
  #p qp
  sdp = [0]
  (0...dp.size).each{ |i| sdp << (sdp[-1] + (i%2 == 0 ? dp[i] : 0)) % Mod }
  #sdp[1] = 0
  (0...qp.size).reverse_each{ |i|
    s = qp[i]
    x = [1,i-a].max
    y = [i+1, dp.size/2].min-1
    s += (sdp[[y*2+1, sdp.size-1].min] - sdp[[x*2, sdp.size-1].min] + Mod)
    # (x..y).each{ |j|
    #   s = (s + dp[j*2])
    # }
    qp[i] = s % Mod
  }
  #p qp
  dp,qp = qp,dp
}
p (ans + (0..10).reduce(0){ |a,b| i = (1 << b); a + (i < dp.size ? dp[i] : 0) }) % Mod