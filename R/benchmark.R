#' Benchmark My K-Means vs Base K-Means
#'
#' This function compares the performance of `my_kmeans` and base R's `kmeans`.
#'
#' @param data A numeric matrix or data frame.
#' @param centers The number of clusters.
#' @param nstart The number of random sets to be chosen.
#' @return A benchmark result showing the performance comparison.
#' @examples
#' data <- matrix(rnorm(1000), ncol = 2)
#' benchmark_kmeans(data, centers = 3, nstart = 10)
#' @export
benchmark_kmeans <- function(data, centers, nstart = 10) {
  if (!is.matrix(data) && !is.data.frame(data)) stop("data must be a matrix or data frame")
  if (!is.numeric(centers) || centers <= 0) stop("centers must be a positive integer")

  bench::mark(
    base_kmeans = kmeans(data, centers = centers, nstart = nstart),
    my_kmeans = my_kmeans(data, centers = centers, nstart = nstart),
    check = FALSE
  )
}
