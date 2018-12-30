P = gets.to_f
LN215 = Math.log(2.0)/1.5
if P*LN215 < 1.0 + 1e-6
  p P; exit
end

X0 = Math.log( P*LN215 ) / LN215
p X0 + P*Math.exp(-X0*LN215)