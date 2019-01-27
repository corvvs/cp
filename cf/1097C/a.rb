N = gets.to_i
es = {}

def judge(s)
  t = []
  s.each{ |c|
    if t.size > 0 && t[-1] == "(" && c == ")"
      t.pop
    else
      t << c
    end
  }
  t.size == 0 ? 0 : (t[0] == t[-1] ? (t[0] == "(" ? t.size : -t.size) : nil)
end

N.times {
  s = gets.chomp.split("")
  x = judge(s)
  #p [s.join(""),x]
  next if !x
  es[x] = (es[x] || 0) + 1
}
#p es
p es.keys.select{ |x| x > 0 }.reduce(0){ |a,x| a + [es[x] || 0, es[-x] || 0].min } + (es[0] || 0)/2