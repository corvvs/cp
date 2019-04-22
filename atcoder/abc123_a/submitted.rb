as = `dd`.split.map &:to_i
puts as[-2] - as[0] > as[-1] ? ":(" : "Yay!"