K,M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).reverse
C = gets.split.map(&:to_i)

def mul(mat1, mat2)
  ret = (0...K).map{ Array.new(K, 0) }
  m2 = mat2.transpose
  K.times{ |i|
    row = mat1[i]
    rrr = ret[i]
    K.times{ |j|
      col = m2[j]
      r = 0
      K.times{ |k|
        r ^= (row[k] & col[k])
      }
      rrr[j] = r
    }
  }
  ret
end

kk = M - 1
mat = (0...K).map{ Array.new(K, 0) }
mat[0] = C
(1...K).each{ |i|
  mat[i][i-1] = (1 << 32) - 1
}

ret = (0...K).map{ Array.new(K, 0) }
(0...K).each{ |i| ret[i][i] = (1 << 32) - 1 }
b = 1
c = 0
while b <= kk
  if (b & kk) > 0
    c += b
    ret = mul(ret, mat)
  end
  #p kk, b, mat, ret
  mat = mul(mat, mat)
  b <<= 1
end

#p kk, c, A, ret
p (0...K).reduce(0){ |a,i| a ^ (A[i] & ret[-1][i]) }
