def sim(as, max_move = 10000)
  as.sort!
  ans = 0
  while as[-1] > 0 && ans <= max_move
    as.map!{ |a| a+1 }
    as[-1] -= N+1
    as.sort!
    ans += 1
  end
  ans <= max_move ? ans : nil
end

N,*as = `dd`.split.map &:to_i
as.map!{ |a| a - N + 1 }

if n = sim(as.clone)
  p n; exit
end

as.sort!
ms = [0] + as[1..-1].map{ |a| (a-as[0])/(N+1) + 1 }
m = ms.inject(:+)
(0...N).each{ |i| as[i] = as[i] + m - ms[i]*(N+1) }

k = as.min - (N+1)
as.map!{ |a| a - k }
p m + k*N + sim(as)
