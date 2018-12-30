N,K,*as = `dd`.split.map(&:to_i)
A = as + [0]
if A.inject(:+) == K
  p 1; exit
end
dp = (0..N).map{ Array.new(N+1, K+1) }
dp[0][0] = 0
games = 0
(0...N).each{ |round|
  (0..round).each{ |goods|
    dp[round+1][goods] = [dp[round+1][goods], dp[round][goods]].min
    wins = dp[round][goods]
    win_rate = games == 0 ? 0.0 : wins.to_f / games
    a = A[round] * win_rate
    b = dp[round][goods] + a.ceil + (a.ceil == a ? 1 : 0)
    #p [round, goods, dp[round][goods], win_rate, b]
    if b <= K
      dp[round+1][goods+1] = [dp[round+1][goods+1], b].min
    end
  }
  #p dp
  games += A[round]
}
p (0..N).to_a.rindex{ |i| dp[-1][i] <= K }
