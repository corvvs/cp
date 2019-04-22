#include <iostream>
#include <vector>

typedef long long TI;

std::vector<TI> cdp(std::vector<TI> A, TI S, TI m, TI Mod) {
  TI N = A.size();
  auto dp = std::vector< std::vector<TI> >(N+1);
  for(TI i=0; i <= N; ++i) {
    dp[i] = std::vector<TI>(S+1, 0);
  }
  dp[0][0] = 1;
  TI t = 0;
  for(TI i = 0; i < N; ++i) {
    auto a = A[i];
    for(TI s = 0; s <= t; ++s) {
      auto n = dp[i][s];
      dp[i+1][s+a] = (dp[i+1][s+a] + n) % Mod;
      dp[i+1][s  ] = (dp[i+1][s] + m*n) % Mod;
    }
    t += a;
  }
  return dp[N];
}

int main() {
  TI Mod = 998244353;
  TI N;
  std::vector<TI> A;
  std::cin >> N;
  for(TI i=0; i<N; ++i) {
    TI a; std::cin >> a;
    A.push_back(a);
  }
  TI Z = 1;
  TI S = 0;
  for (TI i=0; i<N; ++i) { 
    Z = Z * 3 % Mod; 
    S += A[i];
  }
  auto D1 = cdp(A, S, 2, Mod);
  TI X = 0;
  for (TI s = (S+1)/2; s <= S; ++s) {
    X = (X + D1[s]) % Mod;
  }
  TI Y = 0;
  if (S % 2 == 0) {
    Y = cdp(A, S, 1, Mod)[S/2] % Mod;
  }
  auto ans = Z - 3*(X-Y);
  while (ans < 0) {
    ans += Mod;
  }
  ans %= Mod;
  std::cout << ans << std::endl;
}
