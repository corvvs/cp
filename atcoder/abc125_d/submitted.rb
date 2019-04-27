N,*A = `dd`.split.map &:to_i
s = A.inject(0){ |a,b| a + b.abs }
if A.count{ |a| a < 0 } % 2 == 1
  s -= A.map{ |a| a.abs }.min * 2
end
p s
