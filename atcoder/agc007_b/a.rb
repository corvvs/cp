# https://atcoder.jp/contests/agc007/submissions/4470638
N,*P = `dd`.split.map(&:to_i)

ain  = Array.new(N+1, 0)
bin  = Array.new(N+1, 0)

P.each_with_index{ |q,k|
  bin[0]   += k+1
  bin[q]   -= k+1
  ain[q-1] += k+1
  ain[N]   -= k+1
}

x = 0
puts (0...N).map{ |i| x += ain[i] }.join(" ")
x = 0
puts (0...N).map{ |i| x += bin[i] }.join(" ")
