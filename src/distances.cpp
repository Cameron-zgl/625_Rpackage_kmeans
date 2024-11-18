#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector calculate_distances(NumericMatrix data, NumericVector center) {
  int n = data.nrow();
  NumericVector distances(n);

  for (int i = 0; i < n; i++) {
    double dist = 0;
    for (int j = 0; j < data.ncol(); j++) {
      dist += pow(data(i, j) - center[j], 2);
    }
    distances[i] = sqrt(dist);
  }
  return distances;
}
