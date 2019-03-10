# https://atcoder.jp/contests/abc088/submissions/4532954
H,W = gets.split.map &:to_i
S = (0...H).map{ gets.chomp.split("") }
walls = S.flatten.count("#")

bfs = [0]
visited = {}
d = 1
road = nil
while bfs.size > 0
  d += 1
  bfs.each{ |w| visited[w] = 1 }
  nbfs = []
  bfs.each{ |w|
    i = w/W; j = w % W
    [
      [i+1,j],
      [i-1,j],
      [i,j+1],
      [i,j-1],
    ].map{ |u,v|
      w = u*W+v
      if 0 <= u && u < H && 0 <= v && v < W && S[u][v] == "." && !visited[w]
        nbfs << w
      end
    }
  }
  bfs = nbfs.uniq
  if bfs.include?(H*W-1)
    road = d
    break
  end
end

p road ? H*W - road - walls : -1