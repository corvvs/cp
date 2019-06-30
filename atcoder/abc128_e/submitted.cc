#include <set>
#include <iostream>
#include <vector> 
#include <algorithm> 
#include <cmath> 

typedef std::pair<double,int> P;

int main() {
  int N, Q;
  auto ops = std::vector<P>(0);
  std::cin >> N >> Q;
  for(int i = 0; i < N; ++i) {
    int s,t,x;
    std::cin >> s >> t >> x;
    ops.push_back(std::make_pair(s - 0.1 - x,  x)); 
    ops.push_back(std::make_pair(t - 0.2 - x, -x)); 
  }

  std::sort(
    ops.begin(), 
    ops.end(), 
    [&](P x, P y){return x.first < y.first; }
  );

  auto st = std::set<int>();
  int k = 0;
  for(int i = 0; i < Q; ++i) {
    double x; std::cin >> x;
    while (k < ops.size()) {
      auto time = ops[k].first;
      if (x < time) { break; }
      auto sx = ops[k].second;
      //std::cout << k << ", " << time << ", " << sx << std::endl;
      if (sx > 0) {
        st.insert(sx);
      } else {
        st.erase(-sx);
      }
      k += 1;
    }
    std::cout << (st.empty() ? -1 : *st.begin()) << std::endl;
  }
}
