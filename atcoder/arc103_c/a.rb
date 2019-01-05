# https://atcoder.jp/contests/arc103/submissions/3673643
S = gets.chomp
if S[-1] == "1"
  p -1; exit
end
n = S.size
T = S[0...-1]
if T.reverse != T || T[0] != "1"
  p -1; exit
end

k = 1
(1..(T.size+1)/2).reverse_each{ |i|
  if T[i-1] == "1"
    r = k
    (n - i - 1).times{
      puts "#{r} #{k += 1}"
    }
    puts "#{r} #{k += 1}"    
    n = i
  end
}
