S = gets.chomp
K = gets.to_i
s = S.match(/^1*([^1]|$)/)[0]
puts s[K-1] || s[-1]