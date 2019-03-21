N = gets.to_i
x = 1; y = 1
N.times { |n|
  a,t = gets.split.map &:to_i
  n = [(x % a == 0 ? 0 : 1) + x/a, (y % t == 0 ? 0 : 1) + y/t].max
  x = a*n
  y = t*n
}
p x+y