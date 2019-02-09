N,A,B,*P=`dd`.split.map &:to_i
ns=[0,0,0]
P.each{ |q|
  if q <= A
    ns[0] += 1
  elsif q <= B
    ns[1] += 1
  else
    ns[2] += 1
  end
}
p ns.min