ns = [0,0,0,0]
3.times{
  a,b = gets.split.map &:to_i
  ns[a-1] += 1
  ns[b-1] += 1
}
puts ns.sort == [1,1,2,2] ? "YES": "NO"