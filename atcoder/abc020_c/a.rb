H,W,T = gets.split.map(&:to_i)
SS = :S
SG = :G
SB = "#".intern
SW = ".".intern
CS = (0...H).map{ gets.chomp.split("").map(&:intern) }.flatten
TS = CS.index(SS)
TG = CS.index(SG)
p CS, TS, TG
