r,D,x = gets.split.map &:to_i
10.times {
  x = r*x-D
  p x
}