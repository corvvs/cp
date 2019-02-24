Mod = 10**9+7
N,M,*F = `dd`.split.map &:to_i
eh = Hash[(1..M).map{ |f| [f,N] }]
es = Array.new(N,nil)
(0...N).reverse_each{ |i|
  j = eh[F[i]]
  es[i] = j
  eh[F[i]] = i
}
ms = Array.new(N,nil)
ms[-1] = es[-1]
(0...N-1).reverse_each{ |i|
  ms[i] = es[i] < ms[i+1] ? es[i] : ms[i+1]
}
#p F,es,ms

dp = Array.new(N,0)
dp = 0
din = Array.new(N+1,0)
din[0] = 1
dout = Array.new(N+1,0)
dout[0] = 1
(0..N).each{ |i|
  dp = (dp + din[i]) % Mod
  if i < N
    m = ms[i]
    din[i+1] = (din[i+1] + dp) % Mod
    dout[m] = (dout[m] + dp) % Mod
  end
  #p [i, dp, din, dout]
  break if i == N
  dp = (dp - dout[i] + Mod) % Mod
}
p dp