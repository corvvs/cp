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

N,K,*A = `dd`.split.map &:to_i
ss = [0]
A.each{ |a| ss << ss[-1] + a - K }
smap = {}
ss[1..-1].sort.each_with_index{ |s,i| smap[s] = i }

st = BIT.new(N, 0) { |a,b| a + b }
ans = 0
ct = {}
ss[1..-1].each{ |s|
  ans += 1 if s >= 0
  i = smap[s]
  ans += st.find(i)
  st.add(i, 1)
}
p ans
