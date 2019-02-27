# https://atcoder.jp/contests/arc050/submissions/4407099
def powmod(b,r,mod)
  a = 1
  while r > 0
    if r%2 == 1
      a = a * b % mod
    end
    b = b * b % mod
    r /= 2
  end
  a
end

A,B,M = gets.split.map &:to_i
G = A.gcd(B)
DG = powmod(10, G, M)

def u(b, n)
  return 1 if n == 1
  case n%2
  when 1
    u(b, n-1) * b + 1
  when 0
    u(b, n/2) * (powmod(b, n/2, M) + 1)
  end % M
end

p u(10, A) * u(DG, B/G) % M