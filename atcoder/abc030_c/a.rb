N,M = gets.split.map &:to_i
X,Y = gets.split.map &:to_i
as = gets.split.map(&:to_i) + [10**15]
bs = gets.split.map(&:to_i) + [10**15]
dpa = Array.new(as.size+1,0)
dpb = Array.new(bs.size+1,0)
ts = (0...as.size).map{ |a| [a,:a] } + (0...bs.size).map{ |b| [b,:b] }
ts.sort_by{ |i,d| d == :a ? as[i] : bs[i] }.each{ |i,d|
  case d
  when :a
    dpa[i+1] = [dpa[i+1],dpa[i]].max
    k = (0...bs.size).bsearch{ |k| as[i] + X <= bs[k] }
    if k
      dpb[k+1] = [dpb[k+1], dpa[i+1]+1].max
    end
  when :b
    dpb[i+1] = [dpb[i+1],dpb[i]].max
    k = (0...as.size).bsearch{ |k| bs[i] + Y <= as[k] }
    if k
      dpa[k+1] = [dpa[k+1], dpb[i+1]+1].max
    end
  end
}
p dpa[-1]/2