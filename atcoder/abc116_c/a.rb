N,*H = `dd`.split.map(&:to_i)
ans = 0
(1..H.max).each{ |h|
  std = H.map{ |g| g >= h ? "1" : "0"}.join.split(/0+/).reject{ |s| s == ""}
  ans += std.size
}
p ans