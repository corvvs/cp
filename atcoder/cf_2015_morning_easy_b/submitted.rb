N = gets.to_i
S = gets.chomp
if N % 2 == 1
  p -1; exit
end
p (0...N/2).reduce(0){ |a,i| a + (S[i] != S[i+N/2] ? 1 : 0) }
