N = gets.to_i
Q = gets.split.map &:to_i
ps = [0]
Q.each{ |q| ps << (ps[-1] + q) }
mx = ps.max
mn = ps.min
if mx - mn == N-1 && ps.uniq.size == N
  puts ps.map{ |r| r - mn + 1 }.join(" ")
else
  p -1
end