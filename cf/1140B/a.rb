N = gets.to_i
N.times {
  n = gets.to_i
  s = gets.chomp
  p [s.match(/^<*/)[0].size, s.match(/>*$/)[0].size].min
}
