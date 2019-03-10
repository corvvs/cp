# https://atcoder.jp/contests/arc070/submissions/4480840
N,K,*as = `dd`.split.map &:to_i
as.sort!
$stderr.puts N,K,as*" "
ndd = K
nndd = 0
p (0...N).bsearch{ |i|  
  a = as[i]
  next true if ndd <= a
  next false if a <= nndd
  h = { 0 => 1 }
  q = [0]
  ka = K - a
  needed = ka <= 0 && 0 < K
  (0...N).each{ |j|
    b = as[j]
    next if i == j || K <= b
    (0...q.size).each{ |l|
      x = b+q[l]
      next if h[x]
      next if K <= x
      #p [q.size,q[-1]]
      h[x] = 1
      q << x
      if ka <= x
        needed = true; break
      end
    }
    break if needed
  }
  #p [i,a,K-a,K,h.keys.size,needed]
  ndd = a if needed && a < ndd
  nndd = a if !needed && nndd < a
  needed
} || N

#$stderr.puts [ndd,nndd]