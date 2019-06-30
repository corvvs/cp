require "set"

N,Q = gets.split.map &:to_i
blocks = []
N.times {
  s,t,x = gets.split.map &:to_i
  blocks << [s-x-0.1, x, 1]
  blocks << [t-x-0.2, x, 2]
}
blocks.sort!
st = SortedSet.new([])
i = 0
(0...Q).each{
  x = gets.to_i
  while i < blocks.size do
    t,y,q = blocks[i]
    break if x < t
    i += 1
#    p [x,t,y,q,n]
    if q == 1
      st.add(y)
    else
      st.delete(y)
    end
  end
  puts st.first || -1
}