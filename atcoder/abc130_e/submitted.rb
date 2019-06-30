N,M = gets.split.map &:to_i
S = gets.split.map &:to_i
T = gets.split.map &:to_i
Mod = 10**9+7
V = (0..N).map{ Array.new(M+1,0) }
(0..N).each{ |i| V[i][0] = 1 }
(0..M).each{ |i| V[0][i] = 1 }
ans = 1
(1..N).each{ |i|
  vii = V[i-1]
  vi  = V[i]
  sii = S[i-1]
  (1..M).each{ |j|
    u = sii != T[j-1] ? 0 : vii[j-1]
    ans = (ans + u) % Mod
    vi[j] = (u + vii[j] + vi[j-1] - vii[j-1]) % Mod
  }
}
p ans
