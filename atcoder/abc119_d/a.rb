A,B,Q = gets.split.map &:to_i
S = (0...A).map{ gets.to_i }
T = (0...B).map{ gets.to_i }

def rs(x)
  (0...A).bsearch{ |i| x <= S[i] }
end

def ls(x)
  i = rs(x)
  i ? (i>0 ? i-1 : nil) : A-1
end

def rt(x)
  (0...B).bsearch{ |i| x <= T[i] }
end

def lt(x)
  i = rt(x)
  i ? (i>0 ? i-1 : nil) : B-1
end

(0...Q).each{
  x = gets.to_i
  vs = []
  rsi = rs(x)
  lsi = ls(x)
  rti = rt(x)
  lti = lt(x)
  vs << S[rsi] + x  - 2*T[lti] if rsi && lti
  vs << 2*S[rsi] - x  - T[lti] if rsi && lti
  vs << T[rti] + x  - 2*S[lsi] if rti && lsi
  vs << 2*T[rti] - x  - S[lsi] if rti && lsi
  if rsi
    if rrti = rt(S[rsi])
      vs << T[rrti] - x
    end
  end
  if rti
    if rrsi = rs(T[rti])
      vs << S[rrsi] - x
    end
  end
  if lsi
    if llti = lt(S[lsi])
      vs << x - T[llti]
    end
  end
  if lti
    if llsi = ls(T[lti])
      vs << x - S[llsi]
    end
  end
  p vs.min
}
