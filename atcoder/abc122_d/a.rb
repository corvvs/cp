N = gets.to_i
if N == 3
  p 61; exit
end

Mod = 10**9+7
CS = ["A","G","C","T"]

def gen(s = "")
  return s if s.size == 4
  CS.map{ |c|
    gen(s + c)
  }.flatten(1)
end

ss = gen()
dp = Hash[ss.map{ |s| [s,1] }]

[
  "AGC*",
  "GAC*",
  "ACG*",
  "*AGC",
  "*GAC",
  "*ACG",
  "A*GC",
  "AG*C",
].each{ |s|
  ["A","T","G","C"].each{ |c|
    dp.delete(s.sub("*",c))
  }
}

(4...N).each{
  ddp = Hash[dp.map{ |s,v| [s,0] }]
  dp.each{ |s,v|
    CS.each{ |c|
      t = s[1..3]+c
      if ddp[t]
        #p "#{s} -> #{t}"
        ddp[t] = (ddp[t] + dp[s]) % Mod
      end
    }
  }
  dp = ddp
}
p dp.values.inject(:+) % Mod
