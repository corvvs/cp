S = gets.chomp
T = gets.chomp
N = gets.to_i
N.times {
  a,b,c,d = gets.split.map &:to_i
  puts [S[a-1..b-1], T[c-1..d-1]] * " "
}
