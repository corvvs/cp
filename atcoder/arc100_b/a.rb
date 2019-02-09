# https://atcoder.jp/contests/abc102/submissions/4201965
N,*A = `dd`.split.map &:to_i
sa = []
A.each{ |a| sa << (sa[-1] || 0) + a }
#p A, sa
ans = A.inject(:+)
(1...N-2).each{ |i|
  bc = sa[0..i]
  de = sa[i+1..N-1]
#  p [bc, de]
  san = sa[N-1]
  sai = sa[i]
  j = (0...i).bsearch{ |j|
    sai/2 <= sa[j]
  } || i-1
  if 0 < j
    j -= 1 if (sai-sa[j-1]-sa[j-1]).abs < (sai-sa[j]-sa[j]).abs
  end

  k = (i+1...N-1).bsearch{ |k|
    (san-sai)/2 <= (sa[k] - sai)
  } || N-2
  if i+1 < k
    k -= 1 if (san-sa[k-1]-sa[k-1]+sa[i]).abs < (san-sa[k]-sa[k]+sa[i]).abs
  end

  vs = [sa[j], sa[i]-sa[j], sa[k]-sa[i], sa[-1]-sa[k]]
  v = vs.max - vs.min
  #p [A[0..j], A[j+1..i], A[i+1..k], A[k+1..-1]]
  #p [sa[0..j], sa[j+1..i], sa[i+1..k], sa[k+1..-1]], vs, v
  #fail if vs.inject(:+) != sa[-1]
  ans = v if v < ans
}
p ans