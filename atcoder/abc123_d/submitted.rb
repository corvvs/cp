X,Y,Z,K = gets.split.map &:to_i
A,B,C = (0...3).map{ gets.split.map(&:to_i).sort.reverse }
cands = [[0,0,0]]
used = {}
used[cands[0]] = 1
K.times {
  r = (0...cands.size).max_by{ |r|
    i,j,k = cands[r]
    A[i] + B[j] + C[k]
  }
  fail if !r
  #p cands[r]
  i,j,k = cands.delete_at(r)
  puts A[i] + B[j] + C[k]
  ns = []
  if i+1 < X
    ns << [i+1,j,k]
  end
  if j+1 < Y
    ns << [i,j+1,k]
  end
  if k+1 < Z
    ns << [i,j,k+1]
  end
  ns.reject{ |c| used[c] }.each{ |c|
    cands << c
    used[c] = 1
  }
}
