# https://atcoder.jp/contests/arc063/submissions/4817029

N = gets.to_i
es = {}
(N-1).times{
  a,b = gets.split.map &:to_i
  es[a] ||= {}; es[b] ||= {}
  es[a][b] = es[b][a] = 1
}
ranges = Array.new(N+1,nil)
parities = Array.new(N+1,nil)
K = gets.to_i
K.times {
  v,q = gets.split.map &:to_i
  ranges[v] = [q,q]
  parities[v] = q%2
}

queue = [[1,0]]
while queue.size > 0 do
  n,s = queue.pop
  case s
  when 0
    queue << [n,1]
    ks = es[n]
    ks.each{ |m,_|
      es[m].delete(n)
      queue << [m,0]
    }
  when 1
    r = ranges[n]
    q = parities[n]
    rs = es[n].keys.map{ |m| ranges[m] }.compact.map{ |a,b| [a-1,b+1] }
    qs = es[n].keys.map{ |m| parities[m] }.compact.map{ |q| q ^ 1 }
    if r && q
      rs << r
      qs << q
    end
    if qs.uniq.size > 1
      puts "No"; exit 
    end
    next if qs.size == 0 # rs.size == 0
    rmin = rs.map{ |a,b| a }.max
    rmax = rs.map{ |a,b| b }.min
    if rmax < rmin
      puts "No"; exit
    end
    ranges[n] = [rmin, rmax]
    parities[n] = qs[0]
  end
end

puts "Yes"
numbers = Array.new(N+1, nil)
queue = [[1,nil]]
INF = 10**9
while queue.size > 0 do
  n,w = queue.pop
  vs = []
  if w
    vs << w-1
    vs << w+1
  end
  range = ranges[n]
  if range
    vs << range[0]
  end
  v = range ? vs.find{ |v| range[0] <= v && v <= range[1] } : vs[0]
  numbers[n] = v
  es[n].each{ |m,_|
    queue << [m,v]
  }
end

puts numbers[1..-1]
