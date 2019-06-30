class P2
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = a || 0; @b = b || 0; @c = c || 0
  end

  def f(t)
    @a*t*t + @b*t + @c
  end

  def df(t)
    2*@a*t + @b
  end

  def stationary
    @a == 0 ? nil : -@b.to_f/@a/2
  end

  def min(t1,t2)
    vs = [f(t1),f(t2)]
    ts = stationary
    if ts && t1 <= ts && ts <= t2
      vs << f(ts)
    end
    vs.min
  end
end

class P1
  attr_reader :a, :b
  def initialize(a,b)
    @a = a || 0; @b = b || 0
  end

  def f(t)
    @a*t+@b
  end

  def df(t)
    @a
  end

  def self.add(p1,p2)
    self.new(p1.a + p2.a, p1.b + p2.b)
  end

  def self.sub(p1,p2)
    self.new(p1.a - p2.a, p1.b - p2.b)
  end

  def self.prod(p1,p2)
    P2.new(p1.a*p2.a, p1.a*p2.b + p2.a*p1.b, p1.b*p2.b)
  end

  def zero_cross
    @a == 0 ? nil : -@b.to_f/@a
  end
end


N = gets.to_i
XYD = (0...N).map{ gets.split }.transpose
XS = XYD[0].map &:to_i
YS = XYD[1].map &:to_i
DS = XYD[2]

Xmax = {}
Ymax = {} 
Xmin = {}
Ymin = {} 

["L","R","U","D"].each{ |d|
  is = (0...N).select{ |i| DS[i] == d }
  xs = is.map{ |i| XS[i] }
  ys = is.map{ |i| YS[i] }
  Xmax[d] = xs.max; Xmin[d] = xs.min
  Ymax[d] = ys.max; Ymin[d] = ys.min
}

#p Xmin, Xmax, Ymin, Ymax

XUDmin = [Xmin["U"], Xmin["D"]].compact.min
XUDmax = [Xmax["U"], Xmax["D"]].compact.max
YLRmin = [Ymin["L"], Ymin["R"]].compact.min
YLRmax = [Ymax["L"], Ymax["R"]].compact.max

PXmin = []
PXmin << P1.new(0, -XUDmin) if XUDmin
PXmin << P1.new(-1, -Xmin["R"]) if Xmin["R"]
PXmin << P1.new(+1, -Xmin["L"]) if Xmin["L"]
PXmax = []
PXmax << P1.new(0, XUDmax) if XUDmax
PXmax << P1.new(+1, +Xmax["R"]) if Xmax["R"]
PXmax << P1.new(-1, +Xmax["L"]) if Xmax["L"]
PYmin = []
PYmin << P1.new(0, -YLRmin) if YLRmin
PYmin << P1.new(-1, -Ymin["U"]) if Ymin["U"]
PYmin << P1.new(+1, -Ymin["D"]) if Ymin["D"]
PYmax = []
PYmax << P1.new(0, YLRmax) if YLRmax
PYmax << P1.new(+1, +Ymax["U"]) if Ymax["U"]
PYmax << P1.new(-1, +Ymax["D"]) if Ymax["D"]

InterestTimes = {}
InterestTimes[0.0] = InterestTimes[1e10] = 1
[PXmin, PXmax, PYmin, PYmax].each{ |ps|
  (0...ps.size).each{ |i|
    (i+1...ps.size).each{ |j|
      t = P1.sub(ps[i], ps[j]).zero_cross
      if t && t > 0
        #p [ps[i],ps[j],t]
        InterestTimes[t] = 1
      end
    }
  }
}

ITS = InterestTimes.keys.sort
#p ITS
p (0...ITS.size-1).map{ |i|
  t1 = ITS[i]; t2 = ITS[i+1]
  ps = [PXmin, PXmax, PYmin, PYmax].map{ |ps|
    ps.sort_by{ |p| p.f((t1+t2)/2) }.last
  }
  px = P1.add(ps[1], ps[0])
  py = P1.add(ps[3], ps[2])
  p2 = P1.prod(px,py)
  #p ps, px, py, p2, p2.zero, p2.min(t1,t2)
  p2.min(t1,t2)
}.min

