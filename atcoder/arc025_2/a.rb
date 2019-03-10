# https://atcoder.jp/contests/arc025/submissions/4533967
H,W = gets.split.map &:to_i
S = (0...H).map{ gets.split.map &:to_i }
f = (0..H).map{ Array.new(W+1, 0) }
(1..H).each{ |i|
  fi = f[i]
  fii = f[i-1]
  sii = S[i-1]
  (1..W).each{ |j|
    fi[j] = ((i+j)%2 == 0 ? 1 : -1) * sii[j-1] + fii[j] + fi[j-1] - fii[j-1]
  }
}

ans = 0
(1..H).each{ |i|
  fi = f[i-1]
  (i..H).reverse_each{ |u|
    fu = f[u]
    fufi = (0..W).map{ |v| fu[v] - fi[v] }
    col = (u-i+1)
    (1..W).each{ |j|
      fufij = fu[j-1] - fi[j-1]
      s = col * (W-j+1)
      (j..W).reverse_each{ |v|
        break if s <= ans
        if fufi[v] == fufij
          ans = s if s > ans
        end
        s -= col
      }
    }
  }
}
p ans
