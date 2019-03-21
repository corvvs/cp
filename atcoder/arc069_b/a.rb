# https://atcoder.jp/contests/abc055/submissions/4649040
N = gets.to_i
S = gets.chomp

["SS","WW","SW","WS"].each{ |t|
  (2..N+1).each{ |i|
    t << ((t[-2] == "W") ^ (t[-1] == "W") ^ (S[(i-1)%N] == "x") ? "W" : "S")
  }
  if t[0...2] == t[-2..-1]
    puts t[0...N]; exit
  end
}

p -1