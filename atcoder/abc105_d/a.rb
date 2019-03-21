# https://atcoder.jp/contests/abc105/submissions/4631940
N,M,*A = `dd`.split.map &:to_i
s = 0
ct = { 0 => 1 }
ans = 0
A.each{ |a|
  s = (s + a) % M
  ans += (ct[s] || 0)
  ct[s] = (ct[s] || 0) + 1
}
p ans