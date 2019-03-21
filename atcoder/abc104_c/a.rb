D,G = gets.split.map &:to_i
ct = (0...D).map{ gets.split.map &:to_i }
tds = (1..D).to_a.reverse
p (0..D).map{ |n|
  tds.combination(n).map{ |ds|
    m = ds.map{ |d| ct[d-1][0] }.inject(0,:+)
    x = ds.map{ |d| 100*d*ct[d-1][0] + ct[d-1][1] }.inject(0,:+)
    tds.reject{ |d| ds.include?(d) }.each{ |d|
      break if x >= G
      l = ct[d-1][0]
      ll = [(G-x-1)/100/d+1, l-1].min
      m += ll
      x += 100*d*ll
    }
    x >= G ? m : nil
  }
}.flatten.compact.min
