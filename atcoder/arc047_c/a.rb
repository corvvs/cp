# https://atcoder.jp/contests/arc047/submissions/3820867
N,K = gets.split.map(&:to_i)
gs = (1..N).to_a
x = N; y = K
(1..N).each{ |i|
  g = x.gcd(y)
  x /= g; y /= g
  q = x/y
  #p [x,y,q,gs]
  if x == q*y
    puts gs.delete_at(q-1)
    puts gs.reverse
    break
  end
  puts gs.delete_at(q)
  x = (x - q*y) * (N-i)
}
