N = gets.to_i
p (0...N).map {
  a,b = gets.split.map &:to_i
  a + b
}.max