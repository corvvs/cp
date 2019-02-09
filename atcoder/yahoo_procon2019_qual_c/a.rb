K,A,B = gets.split.map &:to_i
if B-A <= 2 || 1+[K-2, 0].max < A
  p 1+K; exit
end

k = K
n = 1
k -= A-1
n += A-1
if k % 2 == 1
  k -=1
  n += 1
end
p (k/2)*(B-A) + n