# https://atcoder.jp/contests/keyence2019/submissions/4002218
N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
ans = 0
s = 0
uppers = []
(0...N).each{ |i|
  if A[i] < B[i]
    s += B[i] - A[i]
    ans += 1
  end
  if A[i] > B[i]
    uppers << (A[i] - B[i])
  end
}
uppers.sort.reverse_each{ |d|
  break if s <= 0
  s -= d
  ans += 1
}
p s > 0 ? -1 : ans
