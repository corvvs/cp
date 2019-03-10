S = gets.chomp
m = S.match(/(.).?\1/)
if m
  puts [m.begin(0)+1, m.end(0)] * " "; exit
end
puts "-1 -1"