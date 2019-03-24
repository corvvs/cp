N = gets.to_i
A = gets.split.map &:to_i
ss = [0]
A.each{ |a| ss << (ss[-1] + a) }
segs = {}
(1..N).each{ |j|
  (1..j).each{ |i|
    seg = [i,j]
    v = ss[j] - ss[i-1]
    segs[v] ||= []
    segs[v] << seg
  }
}

seqs = []
segs.each{ |v,ss|
  rb = 0
  sss = []
  ss.each{ |l,r|
    if rb < l
      sss << [l,r]
      rb = r
    end
  }
  if seqs.size < sss.size
    seqs = sss
  end
}

p seqs.size
seqs.each{ |a,b|
  puts [a,b] * " "
}