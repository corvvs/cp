# https://atcoder.jp/contests/agc009/submissions/4471328
N,*A = `dd`.split.map &:to_i
es = (0..N).map{ [] }
(2..N).each{ |i| es[A[i-2]] << i }
#p es
ds = Array.new(N+1, nil)
que = [1]
while w = que.pop do
  if !ds[w]
    ds[w] = 0
    que << w
    que.concat(es[w])
  else
    ds[w] = es[w].map{ |a| ds[a] }.sort.reverse.map.with_index{ |d,i| d + i + 1 }.max || 0
    #p [w, es[w], es[w].map{ |a| [a,ds[a]] }, ds[w]]
  end
end

p ds[1]