# https://atcoder.jp/contests/abc099/submissions/4650945
N,C = gets.split.map &:to_i
D = (0...C).map{ gets.split.map &:to_i }.transpose
S = (0...3).map{ Array.new(C,0) }
(0...N).each{ |i| 
  gets.split.map(&:to_i).each_with_index{ |c,j|
    S[(i+j)%3][c-1] += 1
  }
}
T = (0...3).map{ |m|
  (0...C).map{ |c|
    dc = D[c-1]
    v = 0
    sm = S[m]
    (0...C).each{ |c| v += dc[c]*sm[c] }
    v
  }
}

ans = 1000*N*N
(0...C).to_a.permutation(3).each{ |x,y,z| 
  v = T[0][x] + T[1][y] + T[2][z] 
  ans = v if v < ans
}
p ans
