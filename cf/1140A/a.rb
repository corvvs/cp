N = gets.to_i
A = gets.split.map &:to_i
ans = 0
am = nil
(1..N).each{ |i|
  a = A[i-1]
  if !am
    am = a
    ans += 1
  end
  am = a if a > am
  if am <= i
    am = nil
    next
  end
}
p ans
