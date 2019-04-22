T = gets.to_i
$params = Array.new(T, nil)

def params(i)
  n,b,f = $params[i-1] || gets.split.map(&:to_i)
  $params[i-1] = [n,b,f]
  n += (16 - n % 16) % 16
  [n,b,f]
end

def query(i, query_str)
  n,b,f = $params[i-1]
  $stdout.puts query_str[0...n]
  $stdout.flush
  gets.chomp + query_str[n..-1]
  # m,_ = params(i)
  # body = body(i)
  # bh = Hash[body.map{ |k| [k,1] }]
  # (0...m).map{ |i| bh[i] ? "" : query_str[i] }.join
end

def guess(i, answer)
  n,b,f = $params[i-1]
  $stdout.puts answer * " "
  $stdout.flush
  gets.chomp
#  answer == TestCaseBody[i-1] ? "1" : "-1"
end


def dig(ss, ll, l, r, depth = 0)
  if depth == 0
    return [] if r-l == 16
    return dig(ss, ll, l, r, depth+1)
  end
  s = ss[depth]
  width = 1 << (4-depth)
  if width == 1
    return [ll + (s[l...r] == "0" ? 1 : 0)]
  end

  m = (l...r).find{ |i| s[i] == "1" } || r
  # s[l...m] = "000..", s[m...r] = "111..."
  #p [s[l...m], s[m...r]]
  ans = []
  if width > m-l
    if l == m
      ans += (ll...ll+width).to_a
    else
      ans += dig(ss, ll, l, m, depth+1)
    end
  end
  if width > r-m
    if m == r
      ans += (ll+width...ll+width*2).to_a
    else
      ans += dig(ss, ll+width, m, r, depth+1)
    end
  end
  ans
end

(1..T).each{ |i|
  n,b,f = params(i)
  resps = [16,8,4,2,1].map{ |k|
    qs = (0...n).map{ |j| (j / k) % 2 }.join
    query(i, qs)
  }
  l = 0
  r = 0
  s = resps[0]
  spt = s.split(/(?<=0)(?=1)|(?<=1)(?=0)/)
  ans = []
  (0...spt.size).each{ |i|
    ss = spt[i]
    r += ss.size
    ll = i*16
    rr = ll+16

    ans += dig(resps, ll, l, r)

    l = r
  }
  if guess(i,ans) != "1"
    exit # failed
  end
}
