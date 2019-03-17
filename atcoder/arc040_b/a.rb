# https://atcoder.jp/contests/arc040/submissions/4615538
N,R = gets.split.map &:to_i
S = gets.chomp
sp = []
i = S.size-1
while i >= 0 do
  case S[i]
  when "o"
    i -= 1
  when "."
    sp << [i-R+1,0].max
    i -= R
  end
end
p sp.size + (sp[0] || 0)
