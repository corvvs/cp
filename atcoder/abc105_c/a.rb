n = gets.to_i
if n == 0
  p 0; exit
end
x = 1
ans = ""
while n.abs > 0 do
  if n.abs%2 == 1
    ans += "1"
    n -= x
  else
    ans += "0"
  end
  break if n == 0
  n = n.abs/2 * (n/n.abs)
  x = -x
end
puts ans.reverse