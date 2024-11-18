#' Visualize K-Means Clustering Results
#'
#' This function visualizes the clustering results in 2D space.
#'
#' @param data A numeric matrix or data frame with exactly 2 columns.
#' @param clusters A numeric vector of cluster assignments (e.g., 1, 2, 3).
#' @param centers A numeric matrix of cluster centers with 2 columns.
#' @return A scatter plot of the clustering results.
#' @examples
#' data <- matrix(rnorm(100), ncol = 2)
#' clusters <- kmeans(data, centers = 3)$cluster
#' centers <- kmeans(data, centers = 3)$centers
#' plot_clusters(data, clusters, centers)
#' @export
plot_clusters <- function(data, clusters, centers) {
  if (!is.matrix(data) && !is.data.frame(data)) stop("data must be a matrix or data frame")
  if (ncol(data) != 2) stop("data must have exactly 2 columns")
  if (length(clusters) != nrow(data)) stop("clusters must have the same length as rows in data")
  if (!is.matrix(centers) || ncol(centers) != 2) stop("centers must be a matrix with 2 columns")

  colors <- rainbow(length(unique(clusters)))
  plot(data, col = colors[clusters], pch = 19, main = "K-Means Clustering")
  points(centers, col = "black", pch = 4, cex = 2, lwd = 2)
}
