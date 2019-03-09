# https://atcoder.jp/contests/arc046/submissions/4530488
N,A,B = `dd`.split.map &:to_i
if N <= A
  puts "Takahashi"
elsif A > B
  puts "Takahashi"
elsif A == B && N % (A+1) > 0
  puts "Takahashi"
else
  puts "Aoki"
end
