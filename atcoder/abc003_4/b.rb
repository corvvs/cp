# https://atcoder.jp/contests/abc003/submissions/4678714
C,R,X,Y,D,L = `dd`.split.map &:to_i
Mod = 10**9+7

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

$fs = factorial(900,Mod)
$is = inv_factorial(900,Mod)

def comb(n,r)
  return 0 if r < 0
  return 0 if n < r
  $fs[n] * $is[r] % Mod * $is[n-r] % Mod
end

ans = 0

S = (X-2)*(Y-2)
DL = D+L
case
when X == 1 && Y == 1
  ans = 1
when X == 1
  ans = comb(Y-2, D+L-2)
when Y == 1
  ans = comb(X-2, D+L-2)
else
  (0..0b1111).each{ |corner|
    lu = (corner >> 3) & 1
    ld = (corner >> 2) & 1
    ru = (corner >> 1) & 1
    rd = (corner >> 0) & 1
    u0 = (1^(lu|ru))
    l0 = (1^(lu|ld))
    
    usdss = []
    cds = []
    (u0..X-2).each{ |u|
      us = lu+u+ru
      next if us == 0
      cu = comb(X-2,u)
      (u..X-2).each{ |d|
        ds = ld+d+rd
        next if ds == 0
        cd = cu * comb(X-2,d) % Mod
        usdss << (us+ds)
        cds << (cd * (u == d ? 1 : 2))
      }
    }
    # ixs = (0...usdss.size).to_a.sort_by{ |i| usdss[i] }

    (l0..Y-2).each{ |l|
      next if (lu | l | ld) == 0
      cl = comb(Y-2,l)
      (l..Y-2).each{ |r|
        next if (ru | r | rd) == 0
        cr = cl * comb(Y-2,r) % Mod
        s = DL - l - r
        # k = (0...ixs.size).bsearch{ |k| S >= s - usdss[k] } || ixs.size
        # j = (0...ixs.size).bsearch{ |k| usdss[k] < -s } || ixs.size
        (0...usdss.size).each{ |i|
          rest = s - usdss[i]
          next if rest < 0
          next if S < rest
          cd = cr * cds[i] % Mod
          v = cd * comb(S,rest) * (l == r ? 1 : 2) % Mod
          ans = (ans + v) % Mod
        }
      }
    }
  }
end

p ans * (C-X+1) % Mod * (R-Y+1) % Mod * comb(D+L,D) % Mod
