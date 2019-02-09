# https://atcoder.jp/contests/abc038/submissions/4202702

class SegTree
  attr_reader :original_size, :internal_size

  def initialize(original_size, unit)
    @original_size = original_size
    h = 0
    while (1 << h) < original_size
      h += 1
    end
    @internal_size = (1 << h)
    @height = h
    @array = Array.new((1 << (h+1)) - 1, unit)
  end

  def update(i, val)
    os = 0
    bs = @internal_size
    @array[i] = val
    @height.times do
      j = (os + i) | 1
      val = @array[j ^ 1] > @array[j] ? @array[j ^ 1]: @array[j]
      i >>= 1
      os |= bs
      bs >>= 1
      @array[os+i] = val
    end
    @array[-1]
  end

  def find(a,b)
    lv = nil; rv = nil
    os = 0
    bs = @internal_size
    while a < b
      if (a&1) == 1
        lv = lv ? (lv > @array[a] ? lv : @array[a]) : @array[a]
        a += 1
      end

      if (b&1) == 0
        rv = rv ? (@array[b] > rv ? @array[b] : rv) : @array[b]
        b += -1
      end

      a = ((a-os) >> 1) | os | bs
      b = ((b-os) >> 1) | os | bs
      os |= bs
      bs >>= 1
    end

    if a == b
      lv = lv ? (lv > @array[a] ? lv : @array[a]) : @array[a]
    end
    rv ? (lv > rv ? lv : rv) : lv
  end

  def data
    @array[0...@original_size]
  end

  def fulldata
    @array
  end
end

N = gets.to_i
B = (0...N).map{ gets.split.map &:to_i }.sort_by{ |w,h| [w,-h] }
st = SegTree.new(B.map{ |w,h| h }.max + 1, 0)
B.each{ |w,h|
  st.update(h, st.find(0,h-1)+1)
}
p st.data.max