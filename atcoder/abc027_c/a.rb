N = gets.to_i+1
R = N.bit_length

n,i = 1,0
while n < N do
  n = 2*n + (i%2) ^ (R%2)
  i ^= 1
end
puts [:Takahashi,:Aoki][i]
