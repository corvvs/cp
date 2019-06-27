N = gets.to_i
(0...N).each {
  a,b = (gets.split.map &:to_i).sort
  p a == b ? -1 : b - a
}
