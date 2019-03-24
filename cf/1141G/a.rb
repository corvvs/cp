N,K = gets.split.map &:to_i
es = Hash[(1..N).map{ |n| [n,{}] }]
(1..N-1).each{ |i|
  a,b = gets.split.map &:to_i
  es[a][b] = es[b][a] = i-1
}
R = (1..N).map{ |n| es[n].size }.sort[-K-1]
colors = Array.new(N-1,nil)

queue = [[nil,1]]

while cn = queue.pop do
  c,n = cn
  c = 0 if !c
  es[n].each{  |m,i|
    next if colors[i]
    c = (c + 1) % R
    colors[i] = c
    queue << [c,m]
  }
end

p R
puts colors.map{ |c| c + 1 } * " "