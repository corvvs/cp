N,*A = `dd`.split.map &:to_i
g1 = [nil, A[0]]
g2 = [nil, A[-1]]
(1...N).each{ |i|
  g1 << g1[-1].gcd(A[i])
  g2 << g2[-1].gcd(A[-i-1])
}

g1 << nil
g2 << nil
g2.reverse!
#p g1, g2
p (1..N).map{ |i|
  (g1[i-1] || g2[i+1]).gcd(g2[i+1] || g1[i-1])
}.max