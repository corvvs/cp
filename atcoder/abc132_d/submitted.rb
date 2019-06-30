N,K = gets.split.map &:to_i
Mod = 10**9 + 7

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

# modular-inverse of factorial by mod (assuming prime for every 1..n); O(n * log(mod))
def inv_factorial(n, mod)
  fs = [1]
  f = 1
  (1..n).each{ |k|
    f = f * k % mod
    fs << invmod(f, mod)
  }
  fs
end

def comb(n,r)
  return 0 if r < 0
  return 0 if r > n
  a = $fs[n] * $is[n-r] % Mod * $is[r] % Mod
  $stderr.puts [n,r,a] * " "
  a
end

$fs = factorial(N+1,Mod)
$is = inv_factorial(N+1,Mod)

(1..K).each{ |i|
  blue_sep = i - 1
  blue_fixed = i
  red_sep = i
  red_fixed = i - 1
  p comb(K - blue_fixed + blue_sep, blue_sep) * comb(N - K - red_fixed + red_sep, red_sep) % Mod
}
