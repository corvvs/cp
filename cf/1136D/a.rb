N,M = gets.split.map &:to_i
P = gets.split.map &:to_i
ps = {}
P.each_with_index{ |q,i|
  ps[q] = i+1
}
es = {}

M.times {
  u,v = gets.split.map &:to_i
  if ps[u] + 1 == ps[v]
    es[v] = 1
  end
  if ps[v] + 1 == ps[u]
    es[u] = 1
  end
}

p es.values.inject(0,:+)
