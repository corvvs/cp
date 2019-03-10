N,K,*A = `dd`.split.map &:to_i
ss = [0]
sp = [0]
A.each{ |a| 
  ss << ss[-1] + a
  sp << sp[-1] + [a,0].max
}
#p A, ss, sp
p (0..N-K).map{ |i|
  j = i+K
  x = sp[i]
  z = sp[-1] - sp[j]
  #p [i,j,x,z]
  [x+0+z, x+ss[j]-ss[i]+z].max
}.max
