N,M = gets.split.map &:to_i
as = (gets.split.map &:to_i).sort
ch = {}
M.times {
  b,c = gets.split.map &:to_i
  ch[c] = (ch[c] || 0) + b
}

cs = ch.keys.sort
j = cs.size-1

p (0...N).reduce(0){ |a,i|
  c = if j >= 0
    v = cs[j]
    ch[v] -= 1
    if ch[v] <= 0
      j -= 1
    end
    v
  else
    0
  end
  a + [as[i], c].max
}
