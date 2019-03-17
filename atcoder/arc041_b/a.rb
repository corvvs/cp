# https://atcoder.jp/contests/arc041/submissions/4615973
N,M = gets.split.map &:to_i
B = (0...N).map{ gets.chomp.split("").map &:to_i }
as = [Array.new(M,0),B[0].map{ |b| b }]
(1...N-1).each{ |i|
  ar = Array.new(M,0)
  (1...M-1).each{ |j|
    ar[j] = B[i][j] - as[-2][j] - as[-1][j-1] - as[-1][j+1]
  }
  as << ar
}
puts as.map{ |r| r.join }
