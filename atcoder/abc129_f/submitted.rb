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

def matmul(r, z, mod)
  return [0,0,0] if z < 0
  return [1,0,1] if z == 0
  n = 1
  abc = [0,0,0]
  mul = [
    [r, 0, 1],
    [r, r, 0],
    [0, 0, 1],
  ]
  sat = [
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1],
  ]
  while n <= z do
    if (n & z) > 0
      sat = (0...3).map{ |i|
        si = sat[i]
        (0...3).map{ |j|
          (0...3).reduce(0){ |a,k|
            (a + si[k] * mul[k][j] % mod) % mod
          }
        }
      }
    end
    n *= 2
    mul = (0...3).map{ |i|
      mi = mul[i]
      (0...3).map{ |j|
        (0...3).reduce(0){ |a,k|
          (a + mi[k] * mul[k][j] % mod) % mod
        }
      }
    }
  end
  (0...3).map{ |i| 
    si = sat[i]
    v = (0...3).reduce(0){ |a,j| (a + si[j] * [1,0,1][j] % mod) % mod }
    (abc[i] + v) % mod
  }
end

L,A,B,M = gets.split.map &:to_i

H = (0..18).map{ |k|
  [[(10**k - A - 1)/B, -1].max, L-1].min
}
da = 0
p (1..18).reduce(0){ |a,k|
  z = H[k] - H[k-1] - 1
  next a if z < 0
  x = (A + H[k]*B)
  y = B
  d = (k+1..18).reduce(0){ |a,l| a + l*(H[l] - H[l-1]) }
  k10 = powmod(10, k, M)
  d10 = powmod(10, d, M)
  xm,ym,_ = matmul(k10, z, M)
  v = (x*xm - y*ym) % M * d10 % M

  (a + v) % M
}
