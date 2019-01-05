# https://atcoder.jp/contests/arc102/submissions/3669187
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
    fs << powmod(f, mod-2, mod)
  }
  fs
end

Mod = 998244353
K,N = gets.split.map(&:to_i)
$fs =     factorial(N+K, Mod)
$is = inv_factorial(N+K, Mod)

def hands(n,a,b)
  a = [a,0].max
  ans = 0
  d = 1
  #p [n,a,b]
  (0..b).each{ |r|
    m = n - r + a + r - 1
    k = r + a - 1
    unless m < 0 || k < 0 || m-k < 0
      v = $fs[b] * $is[r] % Mod * $is[b-r] % Mod * $fs[m] % Mod * $is[k] % Mod * $is[m-k] % Mod * d % Mod
      ans = (ans + v) % Mod
      #puts "#{[r,m,k]} C(#{b}, #{r}) * C(#{m}, #{k}) * 2^#{r} = #{v}"
    end
    d = (d << 1) % Mod
  }
  ans
end

(2..2*K).each{ |i|
  sr = [K, i-1].min
  ir = [i-sr, 1].max
  b = (sr-ir)/2+(i%2 > 0 ? 1 : 0)
  a = K-(sr-ir+1)
  #p [i,ir,sr,a,b]
  if i % 2 == 0
    p (hands(N, a, b) + hands(N-1, a, b)) % Mod
  else
    p hands(N, a, b)
  end
}