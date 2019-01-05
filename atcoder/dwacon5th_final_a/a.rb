# https://atcoder.jp/contests/dwacon5th-final-open/submissions/3917774
N,M,K = gets.split.map(&:to_i)
S = gets.chomp.split("").map &:intern
es = {}
M.times {
  a,b = gets.split.map(&:to_i)
  es[a] ||= {}
  es[b] ||= {}
  es[a][b] = es[b][a] = 1
}

all_next_r = Array.new(N)
all_next_b = Array.new(N)

(1..N).each{ |a|
  ns = es[a].keys
  all_next_b[a-1] = ns.all?{ |b| S[b-1] == :B }
  all_next_r[a-1] = ns.all?{ |b| S[b-1] == :R }
}

#p all_next_b, all_next_r

(1..N).each{ |a|
  if K%2 == 0
    if S[a-1] == "R"
      puts "Second"
    else
      puts es[a].keys.any?{ |b| all_next_b[b-1] } ? "First" : "Second"
    end
  else
    puts all_next_r[a-1] ? "Second" : "First"
  end
}