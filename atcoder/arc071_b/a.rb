# https://atcoder.jp/contests/abc058/submissions/4649527
Mod = 10**9 + 7
N,M = gets.split.map &:to_i
X = gets.split.map &:to_i
Y = gets.split.map &:to_i

def ar(xs)
  sx = [0]
  ax = 0
  (0...xs.size).each{ |i|
    sx << (sx[-1] + xs[i] + Mod) % Mod
    ax = (ax + i*xs[i] - sx[-2] + Mod) % Mod
  }
  ax
end
  
p ar(X) * ar(Y) % Mod
