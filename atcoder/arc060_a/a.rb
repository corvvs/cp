N,A,*X = `dd`.split.map &:to_i
S = 50*N
dp = (0..N).map{ Array.new(S+1, 0) }
dp[0][0] = 1
X.each{ |x|
  (0...N).reverse_each{ |i|
    (0..S-x).reverse_each{ |a|
      dp[i+1][a+x] += dp[i][a]
    }
  }
}
#dp.each{ |row| p row }
p (1..N).reduce(0){ |a,n| a + (dp[n][A*n] || 0) }