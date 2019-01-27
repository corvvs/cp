N = gets.to_i
as = [0]
bs = nil
N.times {
  rot = gets.to_i
  bs = as.map{ |a| [(a+rot)%360, (a-rot+360)%360]}.flatten.uniq
  as,bs = bs,as
}
puts as.include?(0) ? "YES" : "NO"