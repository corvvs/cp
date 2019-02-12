# https://atcoder.jp/contests/abc078/submissions/4246160
N,Z,*A = `dd`.split.map &:to_i
INF = 10**15
dp = (0..1).map{ Array.new(N+1, nil) }

def dig(player,i,dp)
  return dp[player][i] if dp[player][i]
  ad = A[i]
  if player == 0    
    v = (i+1...N).map{ |k| dig(1, k, dp) }.max || 0
    dp[player][i] = [v, (ad - A[N]).abs].max
  else
    v = (i+1...N).map{ |k| dig(0, k, dp) }.min || INF
    dp[player][i] = [v, (ad - A[N]).abs].min
  end
  #p [player, i, dp[player][i]]
  dp[player][i]
end
#p N, A
p dig(0,0,dp)