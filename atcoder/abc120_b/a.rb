A,B,K = gets.split.map &:to_i
p (1..100).select{ |x| A % x == 0 && B % x == 0 }.sort.reverse[K-1]