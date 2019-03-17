N,*ds = `dd`.split.map &:to_i
ds.sort!
h = {}
ds.each{ |d| h[d] = (h[d] || 0) + 1 }
Mod = 10**9 + 7
dp = Array.new(ds[-1]+1, 0)
(1..ds[-1]).each{ |d|
  dp[d] = (dp[d-1] + (h[d] || 0)) % Mod
}
(1..3).each{
  ddp = [0]
  (1..ds[-1]).each{ |d|
    ddp << (ddp[-1] + (h[d] || 0) * dp[d/2]) % Mod
  }
  dp = ddp
}
p dp[-1]
