# https://atcoder.jp/contests/arc028/submissions/4537813
N,K,*ages = `dd`.split.map &:to_i
youngers = (1..K).sort_by{ |i| ages[i-1] }
p youngers[-1]#, youngers
h = {}
(K+1..N).each{ |rank|
  age = ages[rank-1]
  if age < ages[youngers[-1]-1]
    h[age] = rank
    r = ages[youngers.pop-1]
    l = youngers[-1] ? ages[youngers[-1]-1] : 0
    (l...r).each{ |a|
      if h[a]
        youngers << h[a]
        h[a] = nil
      end
    }
  end
  p youngers[-1]#, youngers
}