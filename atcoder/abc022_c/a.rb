N,M = gets.split.map &:to_i
INF = 10**15
rt = (0..N).map{ Array.new(N+1,INF) }
core = []
M.times {
  u,v,l = gets.split.map &:to_i
  u,v = v,u if u > v
  if u == 1
    core << [v,l]
    next
  end
  rt[u][v] = rt[v][u] = l
}

if core.size < 2
  p -1; exit
end

(1..N).each{ |k|
  rtk = rt[k]
  (1..N).each{ |i|
    next if i == k
    rti = rt[i]
    rtik = rti[k]
    (i+1..N).each{ |j|
      rtkj = rtk[j]
      if rti[j] > rtik + rtkj
        rt[j][i] = rti[j] = rtik + rtkj
      end
    }
  }
}

ans = (0...core.size).to_a.combination(2).map{ |i,j|
  a,s = core[i]; b,t = core[j]
  rt[a][b] + s + t
}.min
p ans < INF ? ans : -1
