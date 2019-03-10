# https://atcoder.jp/contests/abc064/submissions/4532393
N = gets.to_i
S = gets.chomp
stack = 0
lp = 0
ans = ""
S.chars{ |s|
  case s
  when "("
    stack += 1
  when ")"
    if stack > 0
      stack -= 1
    else
      lp += 1
    end
  end
  ans += s
}
puts ("("*lp) + ans + (")"*stack)