class BIT
  attr_reader :original_size, :op, :array
  def initialize(original_size, unit, &op)
    @original_size = original_size
    @op = op
    @unit = unit
    @array = Array.new(original_size+1, unit)
  end

  def add(i, v)
    i += 1
    while i <= @original_size do
      @array[i] = @op.call(@array[i], v)
      i += i&(-i)
    end
  end

  def find(i)
    r = @unit
    i += 1
    while i > 0 do
      r = @op.call(r, @array[i])
      i = i & (i-1)
    end
    r
  end
end

N,*ds = `dd`.split.map &:to_i
ds.sort!
Mod = 10**9 + 7

dp = (0...4).map{ BIT.new(ds.max+1, 0){ |a,b| (a + b) % Mod } }

ds.each{ |d|
  (1...4).reverse_each{ |i|
    dp[i].add(d, dp[i-1].find(d/2))
  }
  dp[0].add(d, 1)
  #p [d] + dp.map{ |bit| bit.find(d)  }
}
p dp[-1].find(ds.max)
