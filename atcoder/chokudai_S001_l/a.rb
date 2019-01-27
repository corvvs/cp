# https://atcoder.jp/contests/chokudai_S001/submissions/4074564 

n,*a = `dd`.split.map &:to_i
is = {}
a.each_with_index{ |b,i| is[b] = i }

(0...n).each{ |i|
  b = a[i]
  next if b == i+1
  n -= 1
  j = is[i+1]
  a[i],a[j] = a[j],b
  is[b] = j
}
puts n >= 0 && n % 2 == 0 ? "YES" : "NO"