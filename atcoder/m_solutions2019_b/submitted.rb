S = gets.chomp
wins = S.count("o")
rest = 15 - S.size
puts wins + rest >= 8 ? "YES" : "NO"
