# https://atcoder.jp/contests/arc017/submissions/4541270
N,K,*A = `dd`.split.map &:to_i
sep = [0] + (1...N).select{ |i| A[i-1] >= A[i] } + [N]
p (0...sep.size-1).map{ |i| [sep[i+1] - sep[i] - K + 1, 0].max }.inject(:+)
