# https://atcoder.jp/contests/abc112/submissions/4532696
require "prime"
N,M = gets.split.map &:to_i
ds = [1]
M.prime_division.each{ |q,d|
  ds = ds.map{ |x| (0..d).map{ |d| x * (q**d) } }.flatten
}
p ds.select{ |g| M / g >= N }.max