# https://atcoder.jp/contests/abc116/submissions/4062378
N,K = gets.split.map(&:to_i)
ss = []
maxd = {}
N.times{
  t,d = gets.split.map(&:to_i)
  ss << [d,t]
  maxd[t] = [maxd[t] || 0, d].max
}
#p tc
ss.sort!.reverse!
score = 0
tu = {}
ss[0...K].each{ |d,t| score += d; tu[t] = (tu[t] || 0) + 1 }
x = tu.keys.size
score += x ** 2
ans = score
unused = maxd.keys.reject{ |t| tu[t] }.map{ |t| maxd[t] }.sort

#p tc.keys, ss
(0...K).reverse_each{ |i|
  break if unused.size == 0
  d,t = ss[i]
  next if tu[t] <= 1
  a = unused.pop
  x += 1
  score = score - d + a + x**2 - (x-1)**2
  ans = score > ans ? score : ans
  tu[t] -= 1
}
p ans
