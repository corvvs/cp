N = gets.to_i
if N == 1
  p 1; exit
end

PTS = (0...N).map{ gets.split.map &:to_i }.sort

diffs = {}
(0...N).each{ |i|
  (i+1...N).each{ |j|
    dx = (PTS[i][0] - PTS[j][0])
    dy = (PTS[i][1] - PTS[j][1])
    next if dx == 0 && dy == 0
    diffs[[dx,dy]] = 1
  }
}

ans = N
pmap = Hash[PTS.map{ |x,y| [[x,y],1] }]
diffs.keys.each{ |a,b|
  done = {}
  r = 0
  (0...N).each{ |i|
    x,y = PTS[i]
    if !pmap[[x-a,y-b]]
      r += 1
    end
  }
  ans = [ans, r].min
}

p ans
