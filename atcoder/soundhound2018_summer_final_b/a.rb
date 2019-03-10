# https://atcoder.jp/contests/soundhound2018-summer-final-open/submissions/4532622
N,K,*B = `dd`.split.map &:to_i

as = [0]
bs = [0]
(1..N).each{ |i|
  vv = as[-1]+B[i-1]
  if i-K >= 0
    v = bs[-K]
    vv = v if v > vv
  end
  as << vv
  bs << [bs[-1],vv].max
}
p as[-1]
