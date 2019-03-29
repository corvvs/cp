n,N = gets.split.map &:to_i
puts (n <= N) == (n.to_s <= N.to_s) ? "Y" : "N"