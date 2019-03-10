# https://atcoder.jp/contests/code-festival-2017-quala/submissions/4532806
H,W = gets.split.map &:to_i
nums = Hash[("a".."z").map{ |c| [c,0] }]
(0...H).map{ gets.chomp }.join.split("").each{ |c|
  nums[c] += 1
}

if H % 2 == 1 && W % 2 == 1
  if nums.count{ |c,n| n % 2 == 1 } != 1
    puts "No"; exit
  end
  nums.each{ |c,n| nums[c] = n - (n%2) }
end
if nums.count{ |c,n| n % 2 == 1 } > 0
  puts "No"; exit
end
s = (H - H%2) * (W - W%2)
nums.each{ |c,n|
  v = (n/4)*4
  nums[c] -= v
  s -= v
}
puts s <= 0 ? "Yes" : "No"
