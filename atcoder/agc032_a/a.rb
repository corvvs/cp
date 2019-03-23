# https://atcoder.jp/contests/agc032/submissions/4676619
N,*as = `dd`.split.map &:to_i

op = []
(1..N).reverse_each{ |i|
  (1..i).reverse_each{ |j|
    if as[j-1] == j
      op << j
      as.delete_at(j-1)
      break
    end
  }
}

puts op.size == N ? op.reverse : -1