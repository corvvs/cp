N = gets.to_i
N.times {
  a,b = gets.split.map &:to_i
  p a%b
}