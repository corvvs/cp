A,B,C = gets.split.map &:to_f
EPS = 1e-8

def f(t)
  A*t + B*Math.sin(C*Math::PI*t)
end

def ff(t)
  A + B*C*Math::PI*Math.cos(C*Math::PI*t)
end

def ff0(n)
  A + (n % 2 == 0 ? 1 : -1) * B * C * Math::PI
end

n = 0.0
while !(A*n/C <= 100 && 100 <= A*(n+1)/C) do
  n += 1.0
end

nt1 = n/C; nt2 = (n+1)/C

def core(ta, tb, elevation, &f)
  (ta..tb).bsearch{ |t| (elevation ? 1 : -1)*f.call(t) >= 0 } || tb
end

# p [nt1, nt2, f(nt1), f(nt2)]
t = if (ff0(n) > 0) == (ff0(n+1) > 0)
  elevation = (ff0(n) > 0)
  core(nt1, nt2, elevation) { |t| f(t) - 100 }
  # p t
else
  elevation = ff0(n) <= 0
  t0 = core(nt1, nt2, elevation) { |t| ff(t) }
  ele = ff0(n) > 0
  # p [nt1, t0, nt2, ff0(n), ff(t0), ff0(n+1), ele]
  ff0(n) >= 0 ? core(nt1, t0, ele){ |t| f(t) - 100 } : core(t0, nt2,!ele){ |t| f(t) - 100 }
  # p t1
end

p t