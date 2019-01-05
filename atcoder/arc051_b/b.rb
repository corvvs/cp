# https://atcoder.jp/contests/arc051/submissions/3901804
D = gets.to_i
a,b = 1,1
D.times {
  a,b = a+b,a
}
puts "#{a} #{b}"