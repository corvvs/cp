N = gets.to_i
es = {}
D = 10**10
(0...N).each {
  a,b = (gets.split.map &:to_i).sort
  es[a * D + b] = 1
}
p es.keys.size