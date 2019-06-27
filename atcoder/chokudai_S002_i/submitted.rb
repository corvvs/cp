N = gets.to_i
fs = (0...N).map { gets.split.map &:to_i }
maxprod = (0...N).map{ |i| a,b = fs[i]; a*b }.max
if fs.count(maxprod) > 1
  p -1; exit
end
champ = (0...N).find{ |i| a,b = fs[i]; a*b == maxprod }
puts (0...N).all?{ |j|
  next true if champ == j
  (fs[champ][0]-1) / fs[j][1] > (fs[j][0]-1) / fs[champ][1]
} ? champ + 1 : -1
