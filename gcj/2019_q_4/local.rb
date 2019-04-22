T = gets.to_i
#srand(5)

TestCaseParam = (1..T).map{
  n = rand(2..1024)
  b = rand(1..[n-1, 15].min)
  f = 5
  [n,b,f]
}

TestCaseBody = TestCaseParam.map{ |n,b,f|
  (0...n).to_a.sample(b).sort
}

def visualize(i)
  n,b,f = TestCaseParam[i-1]
  bh = Hash[TestCaseBody[i-1].map{ |k| [k,1] }]
  (0...n).map{ |i| bh[i] ? "*" : "." }.join + ("." * ((16 - n % 16) % 16))
end

def params(i)
  n,b,f = TestCaseParam[i-1]
  n += (16 - n % 16) % 16
  bh = Hash[TestCaseBody[i-1].map{ |k| [k,1] }]
  (0...n).map{ |i| bh[i] ? "*" : "." }.join
  [n,b,f]
end

def body(i)
  n,b,f = params(i)
  body = TestCaseBody[i-1]
end

def query(i, query_str)
  n,b,f = TestCaseParam[i-1]
  m,_ = params(i)
  body = body(i)
  bh = Hash[body.map{ |k| [k,1] }]
  (0...m).map{ |i| bh[i] ? "" : query_str[i] }.join
end

def guess(i, answer)
  answer == TestCaseBody[i-1] ? "1" : "-1"
end

#p TestCaseParam, TestCaseBody


def dig(ss, ll, l, r, depth = 0)
  if depth == 0
    #p ss[depth][l...r]
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
  #puts visualize(i)
  resps = [16,8,4,2,1].map{ |k|
    qs = (0...n).map{ |j| (j / k) % 2 }.join
    query(i, qs)
  }
  #puts resps
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
  ok = guess(i,ans)
  if ok != "1"
    p TestCaseParam[i-1], TestCaseBody[i-1]
    fail
  end
  $stderr.puts "Case ##{i}: ok"
}