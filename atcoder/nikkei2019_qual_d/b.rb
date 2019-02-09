N,M = gets.split.map(&:to_i)
es = (0..N).map{ {} }
rs = (0..N).map{ {} }
(N+M-1).times{
  a,b = gets.split.map(&:to_i)
  es[a][b] = 1
  rs[b][a] = 1
}
Root = (1..N).find{ |n| rs[n].size == 0 }
dp = Array.new(N+1, 0)

nodes = [Root]
while n = nodes.pop
  nx = {}
  e = es[n]
  e.keys.each{ |m|
    nodes.push(m)
    dp[m] = [dp[n] + 1, dp[m]].max
  }
end

puts (1..N).map{ |n|
  next 0 if n == Root
  rs[n].keys.find{ |m| dp[n] - dp[m] == 1 }
}