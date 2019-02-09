S = gets.to_i
ar = Array.new(10**7+1, nil)
a = S
n = 1
while !ar[a] do
  ar[a] = 1
  a = a % 2 == 0 ? a/2 : 3*a + 1
  n += 1
end
p n