S = gets.chomp
N = S.size
unsame = {}
(0...N).each{ |i|
  j = N - i - 1
  next if j >= i
  if S[i] != S[j]
    unsame[i] = unsame[j] = 1
  end
}

ans = 0
nu = unsame.keys.size
(0...N).each{ |i|
  j = N - i - 1
  next if i == j
  case
  when nu == 0 || (nu == 2 && unsame[i])
    ans += S[i] == S[j] ? 25 : 24
  else
    ans += 25
  end
}

if N % 2 == 1
  ans += nu == 0 ? 0 : 25
end

p ans
