Mod = 10**20 + 7
S = gets.chomp
la = [0]
S.chars.each{ |c| la << (c == "?" ? la[-1]*3+1 : c == "A" ? la[-1]+1 : la[-1]) % Mod }
tc = [0]
S.chars.reverse_each{ |c| tc << (c == "?" ? tc[-1]*3+1 : c == "C" ? tc[-1]+1 : tc[-1]) % Mod }
p (0...S.size).reduce(0){ |a,i|
  (a + ((S[i] == "?" || S[i] == "B") ? la[i] * tc[-i-2] : 0)) % Mod
}