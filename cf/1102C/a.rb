N,X,Y = gets.split.map &:to_i
A = gets.split.map &:to_i
if X > Y
  p N; exit
end

p (A.count{ |a| a <= X }+1)/2