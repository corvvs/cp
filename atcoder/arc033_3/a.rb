class BIT
  attr_reader :original_size, :op, :array
  def initialize(original_size, unit)
    @original_size = original_size
    @unit = unit
    @array = Array.new(original_size+1, unit)
  end

  def add(i, v)
    i += 1

    while i <= @original_size do
      @array[i] += v
      i += i&(-i)
    end
  end

  def find(i)
    r = @unit
    i += 1
    while i > 0 do
      r += @array[i]
      i = i & (i-1)
    end
    r
  end
end

Q = gets.to_i
N = 2*10**5
st = BIT.new(N, 0)
Q.times {
  t,x = gets.split.map &:to_i
  if t == 1
    st.add(x-1, 1)
  else
    k = (0...N).bsearch{ |i| x <= st.find(i) }
    puts k+1
    st.add(k, -1)
  end
}
