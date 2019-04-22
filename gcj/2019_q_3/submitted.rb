T = gets.to_i
(1..T).each{ |i|
  n,l = gets.split.map &:to_i
  bs = gets.split.map &:to_i
  as = Array.new(l+1,nil)
  j = (0..l-2).find{ |j| bs[j] != bs[j+1] }
  as[j+1] = bs[j].gcd(bs[j+1])
  (0..j).reverse_each{ |j|
    as[j] = bs[j] / as[j+1]
  }
  (j+1...l).each{ |j|
    as[j+1] = bs[j] / as[j]
  }
  # p as
  ps = {}
  as.each{ |a| ps[a] = 1 }
  gs = ("A".."Z").to_a
  ps.keys.sort.each_with_index{ |a,i| ps[a] = i }
  puts "Case ##{i}: "+as.map{ |a| gs[ps[a]] }.join
}
