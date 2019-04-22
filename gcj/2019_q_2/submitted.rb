T = gets.to_i
(1..T).each{ |i|
  n = gets.to_i
  s = gets.chomp
  a = nil
  if s[0] != s[-1]
    a = (s[-1]*(n-1))+(s[0]*(n-1))
  else
    t = s[0] == "S" ? "E" : "S"
    u = t == "S" ? "E" : "S"
    k = (1...s.size).find{ |k| s[k-1] == t && s[k] == t }
    m = s[0...k].count(t)
    a = (t*m)+(u*(n-1))+(t*(n-1-m))
    #p [s,t,u,k,m]
  end
  puts "Case ##{i}: #{a}"
}