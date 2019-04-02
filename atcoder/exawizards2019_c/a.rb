N,Q = gets.split.map &:to_i
S = gets.chomp.chars.map{ |c| c.intern }
QS = (0...Q).map{ 
  t,d = gets.split
  [t.intern, d == "L" ? -1 : +1]
}

i0 = (0...N).bsearch{ |i|
  k = i
  ans = true
  QS.each{ |t,d|
    next if S[k] != t
    k += d
    if k < 0
      ans = false
      break
    end
    if N <= k
      ans = true
      break
    end
  }
  ans
} || N

i1 = (0...N).bsearch{ |i|
  k = i
  ans = false
  QS.each{ |t,d|
    next if S[k] != t
    k += d
    if k < 0
      ans = false
      break
    end
    if N <= k
      ans = true
      break
    end
  }
  ans
} || N

p i1-i0
