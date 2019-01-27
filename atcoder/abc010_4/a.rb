# https://atcoder.jp/contests/abc010/submissions/4095918

N,G,E = gets.split.map &:to_i
*P = gets.split.map &:to_i
es = (0..N).map{ {} }

E.times {
  a,b = gets.split.map &:to_i
  es[a][b] = es[b][a] = 1
}

P.each{ |q|
  es[q][N] = es[N][q] = 1
}

def dash_flow(es, visited, n, flow)
  return flow if n == N
  visited[n] = 1
  e = es[n]
  ans = nil
  e.each{ |m,mf|
    next if mf <= 0
    next if visited[m]
    f = flow > mf ? mf : flow
    ans = dash_flow(es, visited, m, f)
    if ans
      if es[m] && es[m][n]
        e[m] -= f
        es[m][n] += f
      end
      break
    end
  }
  ans
end

visited = Array.new(N+1, nil)
ans = 0
while f = dash_flow(es, visited, 0, 1000000)
  visited.clear
  ans += f
end

p ans
