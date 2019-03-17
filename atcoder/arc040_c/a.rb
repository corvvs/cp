# https://atcoder.jp/contests/arc040/submissions/4615664
N = gets.to_i
s = (0...N).map{ gets.chomp }
ans = 0
(0...N).each{ |i|
  (0...N).reverse_each{ |j|
    if s[i][j] == "."
      ans += 1
      (0..j).each{ |k| s[i][k] = "o" }
      if i+1 < N
        (j...N).each{ |k| s[i+1][k] = "o" }
      end
    end
  }
}
p ans
