## -----------------------------------------------------------------------------
devtools::install_github("Cameron-zgl/625_mypackage")

## -----------------------------------------------------------------------------
library(Kmeans)

# Example data
data <- matrix(rnorm(1000), ncol = 2)

# Clustering
result <- my_kmeans(data, centers = 3, nstart = 10)
print(result)


## -----------------------------------------------------------------------------
# Visualizing the clustering result
plot_clusters(data, result$cluster, result$centers)


## -----------------------------------------------------------------------------
# Benchmarking
benchmark <- benchmark_kmeans(data, centers = 3, nstart = 10)
print(benchmark)


## -----------------------------------------------------------------------------
# Display the benchmark result
benchmark


