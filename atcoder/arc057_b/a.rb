# https://atcoder.jp/contests/arc057/submissions/3901200
N,K,*as = `dd`.split.map(&:to_i)
A = as + [0]
if A.inject(:+) == K
  p 1; exit
end
dp = (0..N).map{ Array.new(N+1, K+1) }
dp[0][0] = 0
games = 0
(0...N).each{ |round|
  dprr = dp[round+1]
  dpr = dp[round]
  (0..round).each{ |goods|
    dprr[goods] = dpr[goods] if dprr[goods] > dpr[goods]
    wins = dpr[goods]
    win_rate = games == 0 ? 0.0 : wins.to_f / games
    a = A[round] * win_rate
    b = dp[round][goods] + a.ceil + (a.ceil == a ? 1 : 0)
    #p [round, goods, dp[round][goods], win_rate, b]
    if b <= K
      dprr[goods+1] = b if dprr[goods+1] > b
    end
  }
  #p dp
  games += A[round]
}
p (0..N).to_a.rindex{ |i| dp[-1][i] <= K }
