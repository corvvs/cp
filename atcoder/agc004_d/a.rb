N,K,*A = `dd`.split.map &:to_i

rtree = Hash[(1..N).map{ |n| [n, []] }]
(2..N).each{ |n| m = A[n-1]; rtree[m] << n }
nn = (2..N).map{ |n| m = A[n-1]; "#{m} #{n}" }.join("\n")
nodes = IO.popen("tsort", "r+") {|io|
  io.puts nn
  io.close_write
  (0...N).map { io.gets.to_i }
}
#p tree, rtree, nodes
dp = Array.new(N+1, 0)
ans = A[0] == 1 ? 0 : 1
(1...N).reverse_each{ |i|
  n = nodes[i]
  dp[n] = (rtree[n].map{ |m| dp[m] }.max || 0) + 1
  if A[n-1] == 1
    dp[n] = 0
  elsif dp[n] == K
    dp[n] = 0; ans += 1
  end
  #p dp
}
p ans