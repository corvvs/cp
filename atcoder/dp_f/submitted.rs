// Thanks for: https://qiita.com/tanakh/items/0ba42c7ca36cd29d0ac8
macro_rules! input {
  (source = $s:expr, $($r:tt)*) => {
    let mut iter = $s.split_whitespace();
    input_inner!{iter, $($r)*}
  };
  ($($r:tt)*) => {
    let mut s = {
      use std::io::Read;
      let mut s = String::new();
      std::io::stdin().read_to_string(&mut s).unwrap();
      s
    };
    let mut iter = s.split_whitespace();
    input_inner!{iter, $($r)*}
  };
}

macro_rules! input_inner {
  ($iter:expr) => {};
  ($iter:expr, ) => {};

  ($iter:expr, $var:ident : $t:tt $($r:tt)*) => {
    let $var = read_value!($iter, $t);
    input_inner!{$iter $($r)*}
  };
}

macro_rules! read_value {
  ($iter:expr, ( $($t:tt),* )) => {
    ( $(read_value!($iter, $t)),* )
  };

  ($iter:expr, [ $t:tt ; $len:expr ]) => {
    (0..$len).map(|_| read_value!($iter, $t)).collect::<Vec<_>>()
  };

  ($iter:expr, chars) => {
    read_value!($iter, String).chars().collect::<Vec<char>>()
  };

  ($iter:expr, usize1) => {
    read_value!($iter, usize) - 1
  };

  ($iter:expr, $t:ty) => {
    $iter.next().unwrap().parse::<$t>().expect("Parse error")
  };
}

use std::cmp;

fn main() {
  input!{
    S: String,
    T: String,
  }
  let ns = S.chars().count();
  let nt = T.chars().count();
  let ss: Vec<char> = S.chars().collect();
  let ts: Vec<char> = T.chars().collect();
  
  
  let mut dp: Vec<Vec<usize>> = Vec::with_capacity(ns+1);
  let mut sp: Vec<Vec<i32>> = Vec::with_capacity(ns+1);
  for i in 0..(ns+1) {
    dp.push(Vec::with_capacity(nt+1));
    sp.push(Vec::with_capacity(nt+1));
    for j in 0..(nt+1) {
      dp[i].push(0);
      sp[i].push(-100);
    }
  }

  for i in 0..(ns+1) {
    for j in 0..(nt+1) {
      if i < ns && j < nt {
        if ss[i] == ts[j] && dp[i+1][j+1] < dp[i][j]+1 {
          dp[i+1][j+1] = dp[i][j]+1;
          sp[i+1][j+1] = 0;
        }
      }
      if i < ns {
        if dp[i+1][j] < dp[i][j] {
          dp[i+1][j] = dp[i][j];
          sp[i+1][j] = 1;
        }
      }
      if j < nt {
        if dp[i][j+1] < dp[i][j] {
          dp[i][j+1] = dp[i][j];
          sp[i][j+1] = -1;
        }
      }
    }
    //println!("{}", format!("{:?}", sp[i]) )
  }
  let mut ans = String::new();
  let mut ki = ns;
  let mut kj = nt;
  while 0 < ki && 0 < kj {
    match sp[ki][kj] {
      1 => ki -= 1,
      -1 => kj -= 1,
      0 => {
        kj -= 1;
        ki -= 1;
        ans.push(ss[ki]);
      },
      _ => {
        break
      }
    }
  }
  println!("{}", ans.chars().rev().collect::<String>())
}