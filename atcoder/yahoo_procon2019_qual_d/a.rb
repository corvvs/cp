L,*A = `dd`.split.map &:to_i
INF = 10**15
dp = (0...5).map{ Array.new(L,INF) }

dp[0][0] = A[0]
dp[1][0] = A[0] == 0 ? 2 : (A[0]%2)
dp[2][0] = (A[0]+1)%2
dp[3][0] = A[0] == 0 ? 2 : (A[0]%2)
dp[4][0] = A[0]

trans = [
  [0,1,2,3,4],
  [1,2,3,4],
  [2,3,4],
  [3,4],
  [4],
]

(0...L-1).each{ |i|
  k = i+1
  (0...5).each{ |si| 
    trans[si].each{ |sk|
    v = case sk
    when 0; A[k]
    when 1; A[k] == 0 ? 2 : A[k]%2
    when 2; (A[k]+1)%2
    when 3; A[k] == 0 ? 2 : A[k]%2
    when 4; A[k]
    end + dp[si][i]
    dp[sk][k] = v if v < dp[sk][k]
    }
  }
}

p (0...5).map{ |s| dp[s][-1] }.min