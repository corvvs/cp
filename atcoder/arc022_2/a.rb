# https://atcoder.jp/contests/arc022/submissions/4534472
N,*A = `dd`.split.map &:to_i
latest_found = {}
ans = 0
leftmost = [0]
A.each_with_index{ |a,i|
  leftmost << [(latest_found[a] || -1) + 1, leftmost[-1]].max
  ans = [ans, i - leftmost[-1] + 1].max
  latest_found[a] = i
}
p ans
