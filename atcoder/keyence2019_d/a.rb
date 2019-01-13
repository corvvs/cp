N,M = gets.split.map(&:to_i)
Mod = 10**9+7
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort

if A.uniq.size < A.size || B.uniq.size < B.size
  p 0; exit
end

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
$fs = factorial(N*M+2, Mod)

$is = {}
def inv_factorial(n, mod)
  $is[n] if $is[n]
  $is[n] = invmod($fs[n], mod)
  $is[n]
end


def combination(a,b,mod)
  return 0 if a < b
  $fs[a]*inv_factorial(a-b, Mod)%Mod*inv_factorial(b, Mod)%Mod
end

es = {}
A.each{ |a| 
  es[a] = :row
}
B.each{ |b|
  es[b] = es[b] ? :rowcol : :col
}


n = 0
m = 0
spent = 0
ans = 1
es.keys.sort.each{ |x|
  type = es[x]
  y,z = nil,nil
  case type
  when :row; y = M-m-1; z = y+1
  when :col; y = N-n-1; z = y+1
  else y = z = N+M-n-m-2
  end
  ans = ans * combination(x-1-spent, y, Mod) % Mod * $fs[z] % Mod
  #p [type,x,spent,y,z, x-1-spent, y, combination(x-1-spent, y, Mod), ans]
  case type
  when :row; n += 1
  when :col; m += 1
  else 
    n += 1; m += 1
  end
  spent += y+1
}
p ans