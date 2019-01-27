N,M = gets.split.map(&:to_i)
Mod = 10**9+7
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort

if A.uniq.size < A.size || B.uniq.size < B.size
  p 0; exit
end

HA = Hash[A.map{ |a| [a,1] }]
HB = Hash[B.map{ |a| [a,1] }]

ans = 1
spent = 0
n = m = 0
(1..N*M).reverse_each{ |x|
  case
  when HA[x] && !HB[x]    
    ans = ans * m % Mod
    n += 1
  when !HA[x] && HB[x]
    ans = ans * n % Mod
    m += 1
  when !HA[x] && !HB[x]
    ans = ans * (n * m - spent) % Mod
  else
    n += 1; m += 1
  end
  spent += 1
}
#p n, m, spent - N*M
p ans