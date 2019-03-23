N = gets.to_i
D = (0...N).map{ gets.split.map &:to_i }
sds = [Array.new(N+1,0)]
(0...N).each{ |i|
  srow = sds[-1]
  row = D[i]
  ds = [0]
  (0...N).each{ |j|
    ds << (row[j] + ds[-1] + srow[j+1] - srow[j])
  }
  sds << ds
}

Q = gets.to_i
g = {}
Q.times {
  q = gets.to_i
  ans = 0
  (1..N).reverse_each{ |w|
    h = q/w
    next if h == 0
    h = N if h > N
    va = g[w*(N+1)+h]
    if !va
      va = 0
      (0...N-h+1).each{ |i|
        sdsi = sds[i]
        sdsih = sds[i+h]
        (0...N-w+1).each{ |j|
          v = sdsih[j+w] - sdsih[j] - sdsi[j+w] + sdsi[j]
          va = v if v > va
        }
      }
      g[w*(N+1)+h] = va
    end
    ans = va if va > ans
    break if h == N
  }
  p ans
}
