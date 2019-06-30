N,K,*A = `dd`.split.map &:to_i
ss = [0]
i = 0
ans = 0
(1..N).each{ |j|
  ss << ss[-1] + A[j-1]
  while i < j do
    break if ss[j] - ss[i] < K
    i += 1
  end
  ans += i
}
p ans
