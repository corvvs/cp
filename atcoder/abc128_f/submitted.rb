N,*S = `dd`.split.map &:to_i

ans = 0
(1..N-2).each{ |c|
  v = 0
  (1..N/c).each{ |n|
    cn = c*n
    a = N-1 - cn
    break if c >= a || ((a % c == 0) && (a / c <= n))
    #$stderr.puts "A = #{a}, B = #{a - c}, C = #{c}, n = #{n}"
    v += S[-1-cn]
    v += S[cn]
    ans = [ans, v].max
  }
}
p ans
