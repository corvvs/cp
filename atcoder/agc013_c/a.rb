# https://atcoder.jp/contests/agc013/submissions/3780256
N,L,T = gets.split.map(&:to_i)
XW = (0...N).map{ 
  x,w = gets.split.map(&:to_f) 
  [x,w == 1 ? 1.0 : -1.0]
}
T2 = T.to_f - 0.25
C = ((T/L)+1)*L
Y = XW.map{ |x,w| (x + w*T2 + C)%L }

X,W = *XW[0]
#p C, X + W*T2, X + W*T2 + C, (X + W*T2 + C)%L, Y
Z = Y[0]
#p XW,X,W
D = XW[1..-1].map{ |x,w|
  next 0 if w == W
  d = case
  when w > W && x >= X
    x - X
  when w > W && x < X
    L - (X - x)
  when w < W && x >= X
    L - (x - X)
  else
    x - X
  end
  #p [x,w,d,T2*(w-W).abs]
  ((d + T2*2)/L).floor
}.inject(:+) || 0
SY = Y.sort
J = SY.index(Z)
I = (J - D.to_i*W + N) % N
puts (0...N).map{ |i| (SY[(i+I)%N] + 0.5).to_i % L }
