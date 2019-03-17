N,M,*V = `dd`.split.map &:to_i
h = {}
V.each{ |a| h[a] = (h[a] || 0) ^ 1 }
puts [:YES,:NO][h.values.reduce(:|)]