#' K-Means Clustering Implementation
#'
#' This function performs K-Means clustering on a dataset.
#'
#' @param data A numeric matrix or data frame.
#' @param centers The number of clusters.
#' @param nstart The number of random sets to be chosen.
#' @return A list with cluster assignments, cluster centers, and within-cluster sum of squares.
#' @examples
#' data <- matrix(rnorm(100), ncol = 2)
#' result <- my_kmeans(data, centers = 3, nstart = 10)
#' @export
my_kmeans <- function(data, centers, nstart = 10) {
  if (!is.matrix(data) && !is.data.frame(data)) stop("data must be a matrix or data frame")
  if (!is.numeric(centers) || centers <= 0) stop("centers must be a positive integer")

  # Implementation
  result <- stats::kmeans(data, centers = centers, nstart = nstart)
  return(list(
    cluster = result$cluster,
    centers = result$centers,
    withinss = result$tot.withinss
  ))
}
