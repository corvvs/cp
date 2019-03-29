# https://atcoder.jp/contests/arc092/submissions/4753351
N,*as = `dd`.split.map &:to_i

# corner case
if as.max < 0
  mx = as.max
  # p as
  ops = []
  j = (0...N).max_by{ |i| as[i] }
  p as[j]
  (j+1...N).reverse_each{ |i| 
    ops << i+1 
    as.delete_at(i)
  }
  (0...j).each{ |i| 
    ops << 1 
    as.delete_at(0)
  }
  fail if as[0] != mx
  puts ops.size, ops
  exit
end

ss = [0,0]
(0...N).each{ |i|
  ss[i%2] += as[i] >= 0 ? as[i] : 0
}

eo = [0,1].max_by{ |i| ss[i] }

Max = ss[eo]
p Max
# p [Max, eo], as
ops = []

(0...N).reverse_each{ |i|
  next if i % 2 != eo
  next if as[i] >= 0
  ops << i+1
  if 0 < i && i < as.size-1
    as[i] = as[i-1] + as[i+1]
    as.delete_at(i+1)
    as.delete_at(i-1)
  else
    as.delete_at(i)   
    eo ^= 1 if i == 0
  end
  # p as
}

(0...as.size).reverse_each{ |i|
  next if i % 2 == eo
  ops << i+1
  if 0 < i && i < as.size-1
    as[i] = as[i-1] + as[i+1]
    as.delete_at(i+1)
    as.delete_at(i-1)
  else
    eo ^= 1 if i == 0
    as.delete_at(i)   
  end  
  # p as
}

# p ss, eo, as
puts ops.size, ops
fail if as[0] != Max
