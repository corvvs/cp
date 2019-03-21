# https://atcoder.jp/contests/arc037/submissions/4617336
N,M = gets.split.map &:to_i
es = {}
M.times {
  a,b = gets.split.map &:to_i
  es[a] ||= {}; es[b] ||= {}
  es[a][b] = es[b][a] = 1
}

def dig(n, visited, edges)
  return false if visited[n]
  visited[n] = 1
  return true if !edges[n]
  edges[n].all?{ |m,_|
    edges[m].delete(n)
    dig(m, visited, edges)
  }
end

visited = {}
p (1..N).map{ |n| dig(n, visited, es) ? 1 : 0 }.inject(:+)
