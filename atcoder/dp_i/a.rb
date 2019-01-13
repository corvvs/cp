N,*P = `dd`.split.map &:to_f

dp = (0..P.size).map{ Array.new(P.size+1, 0.0) }
dp[0][0] = 1.0
P.size.times{ |n|
  q = P[n]
  r = 1 - q
  dpn = dp[n]
  dpnn = dp[n+1]
  (n+1).times{ |k|
    #p [n,k,P[n]]
    dpnn[k]   += dpn[k] * r
    dpnn[k+1] += dpn[k] * q
  }
}
p (0..P.size).select{ |k| k > N/2 }.map{ |k| dp[-1][k] }.inject(:+)