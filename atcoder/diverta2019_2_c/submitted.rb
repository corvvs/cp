N,*A = `dd`.split.map &:to_i
sa = A.sort

x = sa.pop
y = sa.shift
ops = sa.map{ |z|
  if z >= 0
    y0 = y
    y -= z
    [y0,z] * " "
  else
    x0 = x
    x -= z
    [x0,z] * " "
  end
}
ops << [x,y] * " "
p x-y
puts ops
