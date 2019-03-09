A,B = gets.split.map &:to_i

def g(x)
#  (1..x).reduce(:^)
  return 0 if x == 0
  ans = 0
  (1..x.bit_length).each{ |i|
    b = 1 << i
    h = b/2
    s = (x+1) / b * h + [(x+1)%b - h, 0].max
    ans += (s % 2) << (i-1)
  }
  ans
end

p g(B) ^ g(A-1)