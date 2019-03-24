# https://codeforces.com/contest/1141/submission/51783387
N = gets.to_i
A = gets.split.map &:to_i
ss = [0]
A.each{ |a| ss << (ss[-1] + a) }
ans = 0
seqs = []
(0...N).each{ |j|
  (0..j).each{ |i|
    m = 1
    qs = [[i+1,j+1]]
    d = ss[j+1] - ss[i]
    k0 = j+1
    (j+1...N).each{ |k|
      (k0..k).each{ |l|
        e = ss[k+1] - ss[l]
        if d == e
          m += 1
          qs << [l+1,k+1]
          k0 = k+1
          break
        end
      }
    }
    if m > ans
      ans = m
      seqs = qs
    end
  }
}
puts ans
seqs.each{ |a,b| puts [a,b] * " " }
