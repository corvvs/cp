N = gets.to_i
p (2...N).reduce(0){ |a,b| a + b*(b+1) }