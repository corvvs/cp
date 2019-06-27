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

def invmod(f, mod)
  powmod(f, mod-2, mod)
end

def factorial(n, mod)
  fs = [1]
  (1..n).each{ |k| fs << (fs[-1] * k) % mod }
  fs
end

def inv_factorial(n, mod)
  fs = [1]
  f = 1
  (1..n).each{ |k|
    f = f * k % mod
    fs << invmod(f, mod)
  }
  fs
end

N,M,K = gets.split.map &:to_i
Mod = 10**9 + 7
V = (1..N-1).reduce(0){ |a,i| a + i*(N-i) }*M*M + (1..M-1).reduce(0){ |a,i| a + i*(M-i) }*N*N
NM = N*M

# guaranteed: NM >=2, K >= 2
fs = factorial(NM, Mod)
is = inv_factorial(NM, Mod)

R = NM - 2; C = K - 2
p fs[R] * is[R-C] % Mod * is[C] % Mod * V % Mod
