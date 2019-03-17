N,L = gets.split.map &:to_i
lrs = []
dc = "R"
rs = []
ls = []
N.times {
  x,d = gets.split
  x = x.to_i
  if d == dc
    if d == "R"
      rs << x
    else
      ls << x
    end
  else
    if d == "R"
      lrs << [rs,ls]
      rs = [x]
      ls = []
    else
      ls << x
    end
  end
  dc = d
}
if rs.size > 0 || ls.size > 0
  lrs << [rs,ls]
end

if lrs[0][0].size == 0
  lrs[0][0] << 0
end
if lrs[-1][1].size == 0
  lrs[-1][1] << L+1
end

p lrs.map{ |rs,ls| 
  nr = rs.size
  vr = rs[0...-1].reduce(-nr*(nr-1)/2){ |a,x| a + (rs[-1] - x) }
  nl = ls.size
  vl = ls[1..-1].reduce(-nl*(nl-1)/2){ |a,x| a + (x - ls[0]) }
  vr + vl + [nr,nl].max * (ls[0] - rs[-1] - 1)
}.inject(:+)
