# https://atcoder.jp/contests/abc007/submissions/4364193
A,B = gets.split.map &:to_i
C = [0,0,0,0,0,1,1,1,1,1,2]
def solve(s)
  ans = 0
  c = s[0].to_i
  if s.size == 1
    ans = C[c+1]
  else
    case c
    when 4,9
      ans = s[1..-1].to_i + 1
    when
      ans = solve(s[1..-1])
    end
    m = s.size-1
    ans += C[c] * (10**m)
    ans += (c-C[c]) * (10**m - 8**m)
  end
  ans
end

p solve(B.to_s) - solve((A-1).to_s)