# https://atcoder.jp/contests/arc044/submissions/4615220
N,*as = `dd`.split.map &:to_i
Mod = 10**9+7
if as[0] > 0
  p 0; exit
end
as.sort!
ct = { 0 => 1 }
pow = { 0 => 2 }
ans = 1
as[1..-1].each{ |n|
  v = ((pow[n-1] || 1) - 1 + Mod) % Mod
  w = pow[n] || 1
  ans = ans * v % Mod * w % Mod
  pow[n] = (w * 2) % Mod
}
p ans
