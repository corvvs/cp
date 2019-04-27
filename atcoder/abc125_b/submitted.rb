N = gets.to_i
V = gets.split.map &:to_i
C = gets.split.map &:to_i
p (0...N).map{ |i| [V[i] - C[i], 0].max }.inject(0,:+)
