# https://atcoder.jp/contests/arc051/submissions/4383953
Mod = 10**9+7
N,A,B,*AA = `dd`.split.map &:to_i
a = AA.sort

if A == 1
  puts a; exit
end

M0 = a.max
k = B
while k > 0
  break if a.min == M0
  i = (0...N).min_by{ |i| a[i] }
  a[i] *= A
  k -= 1
end

a.sort!
#p a

# A ** kn mod Mod
m = 1
r = k/N
q = A
while r > 0
  if (r & 1) > 0
    m = (m * q) % Mod
  end
  q = (q * q) % Mod
  r /= 2
end

kn_0 = m
kn_1 = (m * A) % Mod
#p [k, B, A*a.min >= a.max, kn_0, kn_1]
b = (a[k % N .. -1] || []).map{ |v| v * kn_0 % Mod } + (a[0 ... k % N] || []).map{ |v| v * kn_1 % Mod }
puts b
