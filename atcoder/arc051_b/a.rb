$counter = 0
def gcd(x,y)
  return x if y == 0
  $counter += 1
  gcd(y, x%y)
end

x,y = gets.split.map(&:to_i)
p gcd(x,y), $counter