N,Q = gets.split.map &:to_i
S = gets.chomp
ss = []
(1...S.size).each{ |i|
  if S[i-1..i] == "AC"
    ss << [i,i+1]
  end
}
#p sb,se
Q.times {
  l,r = gets.split.map &:to_i
  il = (0...ss.size).bsearch{ |i| l <= ss[i][0] } || ss.size
  ir = (0...ss.size).bsearch{ |i| r < ss[i][1] } || ss.size
  #p [l,r,il,ir,S[l-1..r-1]]
  p [ir - il, 0].max
}
