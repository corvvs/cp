N = gets.to_i
L = gets.chomp
R = gets.chomp
lh,rh = (0..1).map{
  h = {}
  ("a".."z").each{ |c| h[c] = [] }
  h["?"] = []
  h
}
(1..N).each{ |i|
  cl = L[i-1]
  lh[cl] << i
  cr = R[i-1]
  rh[cr] << i
}
ans = []
("a".."z").each{ |c|
  while lh[c].size > 0 && rh[c].size > 0 do
    ans << [lh[c].pop, rh[c].pop]
  end
}
("a".."z").each{ |c|
  while lh[c].size > 0 && rh["?"].size > 0 do
    ans << [lh[c].pop, rh["?"].pop]
  end
  while lh["?"].size > 0 && rh[c].size > 0 do
    ans << [lh["?"].pop, rh[c].pop]
  end
}
while lh["?"].size > 0 && rh["?"].size > 0 do
  ans << [lh["?"].pop, rh["?"].pop]
end
p ans.size
ans.each{ |l,r| puts "#{l} #{r}" }