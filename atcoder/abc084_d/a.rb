# https://atcoder.jp/contests/abc084/submissions/4532735
require "prime"
Q = gets.to_i
P = (0..10**5).map{ |n| n.prime? }
ss = [0]
(1..10**5).each{ |n| ss << ss[-1] + (P[n] && P[(n+1)/2] ? 1 : 0) }
Q.times {
  l,r = gets.split.map &:to_i
  p ss[r] - ss[l-1]
}