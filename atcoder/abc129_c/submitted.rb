N,M,*A = `dd`.split.map &:to_i
Mod = 10**9 + 7
dp = Array.new(N+1,0)
dp[0] = 1
Broken = Hash[A.map{ |a| [a,1] }]
(0...N).each{ |i|
  if !Broken[i+1]
    dp[i+1] = (dp[i+1] + dp[i]) % Mod
  end
  if i+2 <= N && !Broken[i+2]
    dp[i+2] = (dp[i+2] + dp[i]) % Mod
  end
}

p dp[-1]
