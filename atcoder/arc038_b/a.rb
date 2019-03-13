# https://atcoder.jp/contests/arc038/submissions/4540972
H,W = gets.split.map &:to_i
S = (0...H).map{ gets.chomp }
$st = (0...H).map{ Array.new(W, nil) }

def dig(i,j)
  return true if H <= i
  return true if W <= j
  return true if S[i][j] == "#"
  return $st[i][j] if $st[i][j]
  $st[i][j] = ([dig(i, j+1), dig(i+1, j+1), dig(i+1, j)].include?(false))
end

puts dig(0,0) ? "First" : "Second"
