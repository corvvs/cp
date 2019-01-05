# https://atcoder.jp/contests/arc091/submissions/3766130
N,A,B = gets.split.map(&:to_i)

begin
  fail if A*B < N
  ss = [B]
  nn = N - B
  fail if nn < 0
  if A == 1
    fail if nn > 0
  else
    fail if nn == 0
    a = A-1
    while a > 0
      fail if nn < a
      if nn % a == 0 && nn/a<= B
        ss += Array.new(a, nn/a)
        break
      end
      r = [B, nn - (a-1)].min
      ss << r
      nn -= r
      a -= 1
    end
    #p [ss.size, ss.inject(:+), ss[-3..-1]]

    
  end
  #p ss.inject(:+)
  arr = (1..N).to_a
  t = 0
  ss.each{ |s|
    if s > 1
      arr[t,s] = arr[t,s].reverse
    end
    t += s
  }
  puts arr.join(" ")
rescue => e
  $stderr.puts e
  p -1; exit
end

