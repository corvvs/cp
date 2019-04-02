a,b,c = `dd`.split.map &:to_i
puts a == b && b == c ? "Yes" : "No"