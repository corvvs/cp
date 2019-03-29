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

N,K = gets.split.map &:to_i
tbs = (0...N).map{
  gets.split.map &:to_i
}.sort_by{ |t,b| -b }
ts = tbs.map{ |t,b| t }
sorted_by_time = (0...N).sort_by{ |i| -ts[i] }

bit_count = BIT.new(N,0){ |a,b| a+b }
bit_sum = BIT.new(N,0){ |a,b| a+b }

ans = 0
(0...N).each{ |i|
  t,b = tbs[i]
  j = sorted_by_time[i]
  bit_count.add(j,1)
  bit_sum.add(j,t)
  kb = [i+1,K].min
  k = (0...N).bsearch{ |j| bit_count.find(j) >= kb }
  v = bit_sum.find(k)
  ans = [ans, b*v].max
}

p ans
