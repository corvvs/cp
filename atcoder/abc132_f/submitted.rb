N,K = gets.split.map &:to_i
Mod = 10**9 + 7

a = N
s = []
si = []
ss = []
while 0 < a do
  x = N/a
  b = (1...a).bsearch{ |y| N/y == x }
  s << x
  si << (b || a)
  ss << a
  a = (b || a) - 1
end

M = s.size
dp0 = (0...M).map{ |i| ss[i] - si[i] + 1 }
dpkk = (0...M).map{ |i| ss[i] - si[i] + 1 }
dpk = Array.new(M, 0)

(1...K).each{ |k|
  dpk = Array.new(M, 0)
  tt = [0]
  dpkk.reverse_each{ |x| tt << (tt[-1] + x) }
  dpk = tt[1..M]
  dpkk = (0...M).map{ |i| dpk[i] * dp0[i] % Mod }
}

p dpkk.reduce{ |a,b| a + b } % Mod
