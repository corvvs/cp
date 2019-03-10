require "prime"
N = gets.to_i
ds = [1]
N.prime_division.each{ |q,d|
  ds = ds.map{ |x| (0..d).map{ |d| x*(q**d) } }.flatten
}
s = ds.inject(:+) - N
puts s < N ? "Deficient" : s == N ? "Perfect" : "Abundant"
