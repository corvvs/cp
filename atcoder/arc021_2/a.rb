# https://atcoder.jp/contests/arc021/submissions/4534228
L,*B = `dd`.split.map &:to_i
X = B.reduce{ |a,b| a ^ b }
if X != 0
  p -1; exit
end
ans = [0]
B[0..-2].each{ |b| ans << (ans[-1] ^ b) }
puts ans
