N = gets.to_i

def gen(n)
  (1..n).map{ |i|
    (i+1..n).map{ |j|
      (i + j) == (n + 1) ? nil : "#{i} #{j}"
    }.compact
  }.flatten(1)
end

if N == 3
  puts [2, "1 3", "2 3"]; exit
end

es = nil
if N % 2 == 0
  es = gen(N)
else
  es = gen(N-1)
  (1..N-1).each{ |i| es << "#{i} #{N}" }
end
puts es.size, es
