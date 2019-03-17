X,Y = gets.split.map &:to_f
N = gets.to_i
PS = (0...N).map{ gets.split.map &:to_f }
p (0...N).map{ |i|
  x0,y0 = PS[i]
  x1,y1 = PS[(i+1)%N]
  x0 -= X; x1 -= X
  y0 -= Y; y1 -= Y

  dx = x1 - x0
  dy = y1 - y0

  a = Math.sqrt(1.0/(dx**2 + dy**2))
  rx0 = a*dy*x0 - a*dx*y0
  ry0 = a*dx*x0 + a*dy*y0
  rx1 = a*dy*x1 - a*dx*y1
  ry1 = a*dx*x1 + a*dy*y1
   p "#{[x0,y0]}, #{[x1,y1]} -> #{[rx0,ry0]}, #{[rx1,ry1]}"
  if ry1 >= 0 && 0 >= ry0
    rx0.abs
  else
    Math.sqrt([rx0**2 + ry0**2, rx1**2 + ry1**2].min)
  end
}.min