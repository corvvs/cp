# https://atcoder.jp/contests/abc051/submissions/4659175
N,M = gets.split.map &:to_i
INF = 10**15
ds = (0...N).map{ Array.new(N, INF) }
es = (0...N).map{ (0...N).map{ [] } }
M.times {
  a,b,c = gets.split.map &:to_i
  a -= 1; b -= 1
  ds[a][b] = ds[b][a] = c
  es[a][b] = [b]; es[b][a] = [a]
}

(0...N).each{ |k|
  dsk = ds[k]
  esk = es[k]
  (0...N).each{ |i|
    next if i == k
    dsi = ds[i]
    esi = es[i]
    (0...N).each{ |j|
      next if i == j
      next if k == j
      v = dsi[k] + dsk[j]
      if v < dsi[j]
        dsi[j] = v
        esi[j] = esi[k] + esk[j]
      end
    }
  }
}

used = {}
(0...N).each{ |i|
  dsi = ds[i]
  esi = es[i]
  (0...N).each{ |j|
    next if dsi[j] == INF
    arr = [i] + esi[j]
    (0...arr.size-1).each{ |a|
      used[arr[a]*N+arr[a+1]] = 1
    }
  }
}
p M - used.size/2

