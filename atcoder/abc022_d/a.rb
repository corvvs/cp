# https://atcoder.jp/contests/abc022/submissions/4131098
N = gets.to_i
D = 10**12

P1 = (0...N).map{ gets.split.map &:to_i }
P2 = (0...N).map{ gets.split.map &:to_i }

def l2(p1,p2)
  (p1[0].to_f-p2[0].to_f) ** 2 + (p1[1].to_f - p2[1].to_f) ** 2
end


def min_distance(pts)
  d = l2(pts[0],pts[1])
  pts.size.times {
    a = rand(pts.size)
    b = rand(pts.size-1)
    b += 1 if a == b
    f = l2(pts[a], pts[b])
    next if f == 0
    d = f if f < d
  }
  d = Math.sqrt(d)
  $stderr.puts d
  ph = {}
  pts.each{ |x,y|
    t = (x/d).to_i + (y/d).to_i*D
    ph[t] ||= []
    ph[t] << [x,y]
  }
  ans = D.to_f
  ph.each{ |t,ps|
    qs = ps + [t-1,t+1,t-D,t+D,t-1+D,t+1+D,t-1-D,t-1+D].map{ |s| ph[s] }.compact.flatten(1)
    ps.each{ |p1|
      qs.each{ |p2|
        d = l2(p1,p2)
        next if d == 0
        ans = d if d < ans
      }
    }
  }
  $stderr.puts ans
  ans
end


p Math.sqrt(min_distance(P2)/min_distance(P1))
