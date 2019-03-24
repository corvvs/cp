N = gets.to_i
S = gets.chomp.split("").map &:intern
Mod = 998244353
ans = 1
H,T = S[0],S[-1]
mh = S.index{ |c| c != H }
mt = N - S.rindex{ |c| c != T } - 1
ans = (ans + mh) % Mod
ans = (ans + mt) % Mod
if S[0] == S[-1]
  ans = (ans + mh*mt) % Mod
end
p ans