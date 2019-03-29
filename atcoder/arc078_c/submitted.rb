# https://atcoder.jp/contests/arc078/submissions/4739893
def query_prod(n)
  $stdout.puts "? #{n}"
  $stdout.flush
  gets.chomp == "Y"
end


def answer_prod(n)
  $stdout.puts "! #{n}"
  $stdout.flush
end

def query(n)
  query_prod(n)
end

def answer(n)
  answer_prod(n)
end

if (0..9).all?{ |i| query(10**i) }
  answer( 10 ** (0..9).find{ |i| query(10**i + 1) } )  
else
  y = (0..9).find{ |y| query(10**y) && !query(10**(y+1)) }
  m = (10**(y+1) ... 10**(y+2)).bsearch{ |i| query(i) }
  answer(m/10)
end
