A,B = gets.split.map &:to_i
p A >= 13 ? B : (A >= 6 ? B/2 : 0)