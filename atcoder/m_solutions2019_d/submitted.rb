N = gets.to_i
es = {}
degs = Array.new(N,0)
(N-1).times {
  a,b = gets.split.map &:to_i
  a -= 1
  b -= 1
  es[a] ||= {}
  es[b] ||= {}
  es[a][b] = b
  es[b][a] = b
  degs[a] += 1
  degs[b] += 1
}

C = (gets.split.map &:to_i).sort

leaves = (0...N).to_a.select{ |a| degs[a] == 1 }

score = 0
pos = Array.new(N, nil)

(0...N).each{ |i|
#  p leaves
  a = leaves.pop
  c = C[i]
  score += c
  pos[a] = c
#  p pos
  b = es[a].keys.first
  break if !b
  degs[a] -= 1
  degs[b] -= 1
  es[a].delete(b)
  es[b].delete(a)
  if degs[b] <= 1
    leaves << b
  end
}

score -= C[-1]

puts score, pos * " "