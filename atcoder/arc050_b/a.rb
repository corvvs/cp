R,B,X,Y = `dd`.split.map(&:to_i)
N = (0..[R,B].min+1).bsearch{ |n|
  # (R-N)/(x-1) >= r
  u1 = ((R-n).to_f/(X-1)).floor
  # (B-Ny)/(y-1) >= r
  u2 = ((n*Y-B).to_f/(Y-1)).ceil
  !(u1 >= u2 && u1 >= 0)
}
p N ? N-1 : 0