N = gets.to_i
s = gets.split.join
s += s
p s.scan(/1+/).map{ |s| s.size }.max || 0