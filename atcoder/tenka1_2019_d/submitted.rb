# TLE!
Mod = 998244353
N,*A = `dd`.split.map &:to_i

S = A.inject(:+)
#p S*N

def cdp(m)
  dp = (0..N).map{ Array.new(S+1, 0) }
  dp[0][0] = 1
  t = 0
  (0...N).each{ |i|
    dpi = dp[i]
    dpii = dp[i+1]
    a = A[i]
    (0..t).each{ |s|
      n = dpi[s]
      #p [t,s,a,s+a]
      dpii[s+a] = (dpii[s+a] + n) % Mod
      dpii[s]   = (dpii[s] + m*n) % Mod
    }
    t += a
  }
  dp[N]
end

Z = (0...N).reduce(1){ |a,i| a * 3 % Mod }

D1 = cdp(2)
X = ((S+1)/2..S).map{ |s| D1[s] || 0 }.inject(:+) % Mod
Y = (S % 2 == 0 ? cdp(1)[S/2] : 0) % Mod
p (Z - 3*(X - Y) + 3*(X - Y).abs * Mod) % Mod
#p "#{Z} - 3*(#{X} - #{Y})"
#p S, D1, Z, X, Y
