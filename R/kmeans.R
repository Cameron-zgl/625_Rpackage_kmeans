#' K-Means Clustering Implementation with C++ Distance Calculation
#'
#' This function performs K-Means clustering on a dataset using a custom C++ function
#' to calculate distances.
#'
#' @param data A numeric matrix or data frame.
#' @param centers The number of clusters.
#' @param nstart The number of random sets to be chosen.
#' @return A list with cluster assignments, cluster centers, and within-cluster sum of squares.
#' @export
my_kmeans <- function(data, centers, nstart = 10) {
  if (!is.matrix(data) && !is.data.frame(data)) stop("data must be a matrix or data frame")
  if (!is.numeric(centers) || centers <= 0) stop("centers must be a positive integer")

  # Initialize centers randomly
  set.seed(42)
  initial_centers <- data[sample(1:nrow(data), centers), , drop = FALSE]
  clusters <- integer(nrow(data))

  for (i in 1:10) { # Run for a fixed number of iterations
    # Compute distances using the C++ function
    distances <- sapply(1:centers, function(k) calculate_distances(data, initial_centers[k, ]))
    clusters <- apply(distances, 1, which.min)

    # Update centers
    for (k in 1:centers) {
      if (sum(clusters == k) > 0) {
        initial_centers[k, ] <- colMeans(data[clusters == k, , drop = FALSE])
      }
    }
  }

  withinss <- sum(sapply(1:centers, function(k) {
    sum((data[clusters == k, , drop = FALSE] - initial_centers[k, ])^2)
  }))

  return(list(
    cluster = clusters,
    centers = initial_centers,
    withinss = withinss
  ))
}
